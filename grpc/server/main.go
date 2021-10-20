package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"os"

	movies_proto "github.com/normac78/flutter-web-grpc/protos/movies_proto_go"
	"google.golang.org/grpc"
)

type server struct {
	movies_proto.UnimplementedTheaterServer
}

// ListMovies implements movies_proto.ListMoviesRequest
func (s *server) ListMovies(ctx context.Context, in *movies_proto.ListMoviesRequest) (*movies_proto.ListMoviesResponse, error) {
	log.Printf("Received: %v", in)
	return &movies_proto.ListMoviesResponse{}, nil
}

// CreateMovie implements movies_proto.CreateMovie
func (s *server) CreateMovie(ctx context.Context, in *movies_proto.Movie) (*movies_proto.RequestStatus, error) {
	log.Printf("Received: %v", in)
	return &movies_proto.RequestStatus{}, nil
}

// GetMovie implements movies_proto.GetMovie
func (s *server) GetMovie(ctx context.Context, in *movies_proto.MovieRequest) (*movies_proto.Movie, error) {
	log.Printf("Received: %v", in)
	return &movies_proto.Movie{}, nil
}

// DeleteMovie implements movies_proto.DeleteMovie
func (s *server) DeleteMovie(ctx context.Context, in *movies_proto.MovieRequest) (*movies_proto.RequestStatus, error) {
	log.Printf("Received: %v", in)
	return &movies_proto.RequestStatus{}, nil
}

func main() {
	movie := &movies_proto.Movie{
		Name: "The Rock",
	}
	log.Println(movie)

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
