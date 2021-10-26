load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")

go_binary(
    name = "main",
    embed = [":client_lib"],
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

go_library(
    name = "client_lib",
    srcs = ["main.go"],
    importpath = "github.com/normac78/flutter-web-grpc/grpc/client",
    visibility = ["//visibility:private"],
    deps = [
        "//protos:movies_proto_go",
        "@org_golang_google_grpc//:go_default_library",
    ],
)

go_test(
    name = "client_test",
    srcs = ["main_test.go"],
    embed = [":client_lib"],
)
