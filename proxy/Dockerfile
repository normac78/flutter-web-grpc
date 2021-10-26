FROM envoyproxy/envoy-alpine-dev:latest
EXPOSE 8080 8081 9901
ENV ENVOY_UID=0
COPY envoy.yaml /etc/envoy/envoy.yaml
RUN apk --no-cache add ca-certificates