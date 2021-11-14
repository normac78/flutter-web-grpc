# flutter-web-grpc
Example Golang gRPC server, Envoy proxy and Flutter frontend.

## Run with Docker
If you have [Docker](https://www.docker.com/) installed, simply pull and run
from [Docker Hub](https://hub.docker.com/repository/docker/normac78/flutter-web-grpc).

You can also [build and run locally](https://github.com/normac78/flutter-web-grpc/blob/main/docs/BUILD.md).

```
docker pull normac78/flutter-web-grpc:server;
docker pull normac78/flutter-web-grpc:client;
docker pull normac78/flutter-web-grpc:proxy;
docker pull normac78/flutter-web-grpc:frontend;
docker run --name theater_server -d -p 50051:50051 normac78/flutter-web-grpc:server;
docker run --name theater_client normac78/flutter-web-grpc:client --server_host host.docker.internal;
docker run --name theater_proxy -d -p 8081:8081 -p 9901:9901 normac78/flutter-web-grpc:proxy;
docker run --name theater_frontend -d -p 8080:80 normac78/flutter-web-grpc:frontend;
```

Navigate to http://127.0.0.1:8080 to interact with the Flutter frontend or
http://127.0.0.1:9901 to see the Envoy Proxy admin panel.

### Stop running images
```
docker container kill theater_server;
docker container kill theater_proxy;
docker container kill theater_frontend;
docker container prune;
```

## Design
This service utilizes a typical microservice architecture.  Docker is used as
the image format, which makes this an easy service to deploy directly on managed
container services like [AWS Fargate](https://aws.amazon.com/fargate/) or
[Google Cloud Run](https://cloud.google.com/run).

![Architecture diagram](https://github.com/normac78/flutter-web-grpc/raw/main/docs/images/design.png)