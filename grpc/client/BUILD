load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_binary(
    name = "main",
    embed = [":debug_lib"],
    visibility = ["//visibility:public"],
)

go_library(
    name = "debug_lib",
    srcs = ["main.go"],
    importpath = "github.com/normac78/flutter-web-grpc/client",
    visibility = ["//visibility:private"],
    deps = [
        "//protos:movies_proto_go",
        "@org_golang_google_grpc//:go_default_library",
    ],
)