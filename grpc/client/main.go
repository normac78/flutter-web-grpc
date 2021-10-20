package main

import (
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

	// ctx := context.Background()
	serverAddress := *serverHostFlag + ":" + *serverPortFlag
	var opts []grpc.DialOption
	opts = append(opts, grpc.WithInsecure())

	conn, err := grpc.Dial(serverAddress, opts...)
	if err != nil {
		log.Fatalf("Unable to connect to gRPC server at %v", err)
	}
	defer conn.Close()

	c := movies_proto.NewTheaterClient(conn)
	log.Println(c)
}
