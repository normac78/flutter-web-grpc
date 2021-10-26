package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net"
	"os"
	"strings"

	movies_proto "github.com/normac78/flutter-web-grpc/protos/movies_proto_go"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/encoding/protojson"
	"google.golang.org/protobuf/proto"
	_ "modernc.org/sqlite"
)

var DB *sql.DB

type server struct {
	movies_proto.UnimplementedTheaterServer
}

// Initialize movies SQL table
func initTable() {
	_, err := DB.Exec(
		`CREATE TABLE IF NOT EXISTS movies (
			id BIGINT NOT NULL PRIMARY KEY,
			json TEXT,
			pb BLOB
		);`)
	if err != nil {
		log.Println(err)
	}
}

// ListMovies implements movies_proto.ListMoviesRequest
func (s *server) ListMovies(ctx context.Context, in *movies_proto.ListMoviesRequest) (*movies_proto.ListMoviesResponse, error) {
	log.Printf("Retrieving movie data: %v", in.Ids)
	var (
		movie_pb_list movies_proto.ListMoviesResponse
	)

	args := make([]interface{}, len(in.Ids))
	for i, id := range in.Ids {
		args[i] = id
	}
	stmt := `SELECT pb from movies WHERE id in (?` + strings.Repeat(",?", len(args)-1) + `)`
	rows, err := DB.Query(stmt, args...)
	if err != nil {
		log.Printf("Error listing movies: %s", err)
	}
	for rows.Next() {
		var (
			movie_pb_bytes []byte
			movie_pb       movies_proto.Movie
		)
		rows.Scan(&movie_pb_bytes)
		err = proto.Unmarshal(movie_pb_bytes, &movie_pb)
		if err != nil {
			log.Printf("Failed to deserialize protobuf: %s", err)
		}
		movie_pb_list.Movies = append(movie_pb_list.Movies, &movie_pb)
	}

	return &movie_pb_list, nil
}

// CreateMovie implements movies_proto.CreateMovie
func (s *server) CreateMovie(ctx context.Context, in *movies_proto.Movie) (*movies_proto.RequestStatus, error) {
	log.Printf("Creating entry for movie: %v", in.Name)

	var (
		create_status  movies_proto.RequestStatus
		movie_json     []byte
		movie_pb_bytes []byte
	)

	movie_pb_bytes, err := proto.Marshal(in)
	if err != nil {
		log.Printf("Failed to serialize input proto to bytes: %s", err)
		create_status.Code = 1
	}

	movie_json, err = protojson.Marshal(in)
	if err != nil {
		log.Printf("Failed to serialize input proto to JSON: %s", err)
		create_status.Code = 1
	}

	_, err = DB.Exec(
		`INSERT INTO
			movies (id, json, pb)
			VALUES ($1, $2, $3)
			ON CONFLICT (id)
			DO UPDATE SET json = $2, pb = $3;`,
		in.Id,
		movie_json,
		movie_pb_bytes)

	if err != nil {
		log.Printf("INSERT failed: %s", err)
		create_status.Code = 1
	}

	return &create_status, nil
}

// GetMovie implements movies_proto.GetMovie
func (s *server) GetMovie(ctx context.Context, in *movies_proto.MovieRequest) (*movies_proto.Movie, error) {
	log.Printf("Received: %v", in)
	var (
		// movie_id       int64
		movie_pb       movies_proto.Movie
		movie_pb_bytes []byte
	)

	err := DB.QueryRow(
		"SELECT pb FROM movies WHERE id=$1",
		in.Id).Scan(&movie_pb_bytes)
	if err != nil {
		log.Println(err)
	}

	err = proto.Unmarshal(movie_pb_bytes, &movie_pb)
	if err != nil {
		log.Printf("Failed to deserialize protobuf: %s", err)
	}

	return &movie_pb, nil
}

// DeleteMovie implements movies_proto.DeleteMovie
func (s *server) DeleteMovie(ctx context.Context, in *movies_proto.MovieRequest) (*movies_proto.RequestStatus, error) {
	log.Printf("Received: %v", in)
	var movie_delete_response movies_proto.RequestStatus

	_, err := DB.Exec("DELETE FROM movies WHERE id=$1", in.Id)
	if err != nil {
		log.Printf("Failed to delete movie: %s", err)
		movie_delete_response.Code = 1
	} else {
		movie_delete_response.Code = 0
	}

	return &movie_delete_response, nil
}

func main() {
	// Initialize DB
	db, err := sql.Open("sqlite", "/tmp/movies.db")
	DB = db
	initTable()
	defer DB.Close()

	// Set server port
	port := os.Getenv("PORT")
	if port == "" {
		log.Printf("No default port set, using 50051...")
		port = "50051"
	}

	// Start gRPC server
	log.Printf("Starting gRPC server on port %s...", port)
	serverPort := fmt.Sprintf(":%s", port)
	lis, err := net.Listen("tcp", serverPort)
	if err != nil {
		log.Fatalf("Failed to open TCP port: %v", err)
	}
	s := grpc.NewServer()
	movies_proto.RegisterTheaterServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		log.Fatalf("Failed to start gRPC server: %v", err)
	}
}
