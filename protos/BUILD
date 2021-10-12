load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

# gazelle:proto disable
proto_library(
    name = "bookshelf_proto",
    srcs = ["bookshelf.proto"],
    deps = ["@com_google_protobuf//:empty_proto"],
)

go_proto_library(
    name = "bookshelf_proto_go",
    importpath = "github.com/normac78/flutter-web-grpc/protos/bookshelf_proto_go",
    protos = [":bookshelf_proto"],
    visibility = ["//visibility:public"],
)