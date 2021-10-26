package main

import (
	"context"
	"flag"
	"log"

	movies_proto "github.com/normac78/flutter-web-grpc/protos/movies_proto_go"
	"google.golang.org/grpc"
)

func main() {
	log.Println("Starting debug gRPC client...")
	serverHostFlag := flag.String("server_host", "localhost", "host:port of gRPC server")
	serverPortFlag := flag.String("server_port", "50051", "host:port of gRPC server")
	flag.Parse()

	// Initialize gRPC client
	ctx := context.Background()
	serverAddress := *serverHostFlag + ":" + *serverPortFlag
	var opts []grpc.DialOption
	opts = append(opts, grpc.WithInsecure())
	conn, err := grpc.Dial(serverAddress, opts...)
	if err != nil {
		log.Fatalf("Unable to connect to gRPC server at %v", err)
	}
	defer conn.Close()
	c := movies_proto.NewTheaterClient(conn)

	// Assemble dummy data
	movies := []string{"Shaun of the Dead", "Hot Fuzz", "The World's End"}
	poster_urls := []string{
		"https://upload.wikimedia.org/wikipedia/en/8/8d/Shaun_of_the_Dead_film_poster.jpg",
		"https://upload.wikimedia.org/wikipedia/en/c/c9/HotFuzzUKposter.jpg",
		"https://upload.wikimedia.org/wikipedia/en/d/d8/The_World%27s_End_poster.jpg",
	}
	trailer_urls := []string{
		"https://www.youtube.com/watch?v=LIfcaZ4pC-4",
		"https://www.youtube.com/watch?v=ayTnvVpj9t4",
		"https://www.youtube.com/watch?v=n__1Y-N5tQk",
	}
	release_years := []int64{2004, 2007, 2013}

	movie_pbs := make([]movies_proto.Movie, 3)
	for i := range movie_pbs {
		movie_pbs[i].Id = int64(i)
		movie_pbs[i].Name = movies[i]
		movie_pbs[i].Director = &movies_proto.Person{
			Name: "Edgar Wright",
		}
		movie_pbs[i].PosterUrl = poster_urls[i]
		movie_pbs[i].TrailerUrl = trailer_urls[i]
		movie_pbs[i].ReleaseYear = release_years[i]
		movie_pbs[i].Actors = []*movies_proto.Person{
			{Name: "Simon Pegg"},
			{Name: "Nick Frost"},
		}
	}

	// CreateMovie
	for i := range movie_pbs {
		_, err = c.CreateMovie(ctx, &movie_pbs[i])
		if err != nil {
			log.Fatalf("CreateMovie failed:", err)
		} else {
			log.Printf("Successfully created movie '%s'.", movie_pbs[i].Name)
		}
	}

	// GetMovie
	best_movie_request := movies_proto.MovieRequest{Id: 1}
	best_movie, err := c.GetMovie(ctx, &best_movie_request)
	if err != nil {
		log.Printf("GetMovie failed: %s", err)
	} else {
		log.Println(best_movie)
	}

	// DeleteMovie
	deleted_movie_resp, err := c.DeleteMovie(ctx, &best_movie_request)
	if err != nil {
		log.Printf("DeleteMovie failed: %s", err)
	} else {
		log.Println(deleted_movie_resp)
	}

	// ListMovies
	movie_list := &movies_proto.ListMoviesRequest{
		Ids: []int64{0, 1, 2},
	}
	movie_list_pb, err := c.ListMovies(ctx, movie_list)
	if err != nil {
		log.Fatalf("ListMovies failed:", err)
	} else {
		log.Println(movie_list_pb)
	}
}
