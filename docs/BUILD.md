# Manual / local build instructions
To manually build and run, you will need [Bazel](https://bazel.build/),
[Docker](https://www.docker.com/) and [Flutter](https://flutter.dev/).

If you are looking for CI/CD integration, see the example GitHub Actions
workflow.

## Build Docker images
From the root of the repo, run the following commands:

```
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //grpc/server:image -- --norun;
docker tag bazel/grpc/server:image theater_server:latest;
docker image rm bazel/grpc/server:image;
bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //grpc/client:image -- --norun;
docker tag bazel/grpc/client:image theater_client:latest;
docker image rm bazel/grpc/client:image;
docker build -t theater_proxy:latest -f proxy/Dockerfile proxy;
cd frontend && flutter build web;
docker build -t theater_frontend:latest .;
cd ..;
```

## Run images
```
docker run --name theater_server -d -p 50051:50051 theater_server:latest;
docker run --name theater_client theater_client:latest --server_host host.docker.internal;
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