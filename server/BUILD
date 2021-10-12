load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test", "go_binary")

# go_binary(
#     name = "main",
#     embed = [":server_lib"],
#     visibility = ["//visibility:public"],
# )

go_binary(
    name = "main",
    embed = [":server_lib"],
    visibility = ["//visibility:public"],
)

go_library(
    name = "server_lib",
    srcs = ["main.go"],
    importpath = "github.com/normac78/flutter-web-grpc/server",
    visibility = ["//visibility:private"],
)

go_test(
    name = "main_test",
    srcs = ["main_test.go"],
)
