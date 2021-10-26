load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")
load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_binary(
    name = "main",
    embed = [":server_lib"],
    visibility = ["//visibility:public"],
)

go_library(
    name = "server_lib",
    srcs = ["main.go"],
    importpath = "github.com/normac78/flutter-web-grpc/grpc/server",
    visibility = ["//visibility:private"],
    deps = [
        "//protos:movies_proto_go",
        "@org_golang_google_grpc//:go_default_library",
        "@org_golang_google_protobuf//encoding/protojson",
        "@org_golang_google_protobuf//proto",
        "@org_modernc_sqlite//:sqlite",
    ],
)

go_image(
    name = "image",
    embed = [":server_lib"],
)

go_test(
    name = "server_test",
    srcs = ["main_test.go"],
    embed = [":server_lib"],
)
