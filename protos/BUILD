load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

# gazelle:proto disable
proto_library(
    name = "movies_proto",
    srcs = ["movies.proto"],
    deps = [],
)

go_proto_library(
    name = "movies_proto_go",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/normac78/flutter-web-grpc/protos/movies_proto_go",
    protos = [":movies_proto"],
    visibility = ["//visibility:public"],
)