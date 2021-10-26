# flutter-web-grpc
Example Golang gRPC server, Envoy proxy and Flutter frontend 

## Build Docker images
```
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //grpc/server:image;
docker tag bazel/grpc/server:image theater_server:latest;
docker image rm bazel/grpc/server:image;
docker build -t theater_proxy:latest -f proxy/Dockerfile proxy;
cd frontend && flutter build web;
docker build -t theater_frontend:latest .;
cd ..;
```