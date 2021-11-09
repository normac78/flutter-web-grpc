# flutter-web-grpc
Example Golang gRPC server, Envoy proxy and Flutter frontend 

## Build Docker images
```
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //grpc/server:image -- --norun;
docker tag bazel/grpc/server:image theater_server:latest;
docker image rm bazel/grpc/server:image;
docker build -t theater_proxy:latest -f proxy/Dockerfile proxy;
cd frontend && flutter build web;
docker build -t theater_frontend:latest .;
cd ..;
```

## Run images
```
docker run --name theater_server -d -p 50051:50051 theater_server:latest;
docker run --name theater_proxy -d -p 8081:8081 -p 9901:9901 theater_proxy:latest;
docker run --name theater_frontend -d -p 8080:80 theater_frontend:latest
```

Navigate to http://127.0.0.1:8080 to interact with the Flutter frontend or
http://127.0.0.1:9901 to see the Envoy Proxy admin panel.

## Stop running images
```
docker container kill theater_server;
docker container kill theater_proxy;
docker container kill theater_frontend;
docker container prune;
```