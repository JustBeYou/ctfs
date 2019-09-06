package(default_visibility=["//visibility:public"])

cc_binary(
    name = "server",
    srcs = ["server.cc"],
    copts = ["-fexceptions"],
    features = ["-use_header_modules"],
    deps = [":subprocess"],
    linkopts = ["-pthread"],
    linkstatic = 1,
)

cc_binary(
    name = "client",
    srcs = ["client.cc"],
    copts = ["-fexceptions"],
    features = ["-use_header_modules"],
    deps = [":client_lib"],
    linkopts = ["-pthread"],
    linkstatic = 1,
)

cc_library(
    name = "client_lib",
    hdrs = ["client_lib.h"],
    copts = ["-fexceptions"],
    deps = [":subprocess"],
    features = ["-use_header_modules"],
)

cc_library(
    name = "subprocess",
    hdrs = ["subprocess.h"],
    copts = ["-fexceptions"],
    features = ["-use_header_modules"],
)

cc_binary(
    name = "executor",
    srcs = ["executor.cc"],
    linkstatic = 1,
)

cc_binary(
    name = "drop_privs",
    srcs = ["drop_privs.cc"],
    linkstatic = 1,
)

cc_library(
    name = "logging",
    srcs = ["logging.cc"],
    hdrs = ["logging.h"],
)

cc_library(
    name = "process-tools",
    srcs = ["process-tools.cc"],
    hdrs = ["process-tools.h"],
    deps = [
        ":logging",
        ":execution_statistics_cc_proto",
  ],
)

cc_binary(
    name = "linux-sandbox",
    srcs = [
            "linux-sandbox.cc",
            "linux-sandbox-options.cc",
            "linux-sandbox-options.h",
            "linux-sandbox-pid1.cc",
            "linux-sandbox-pid1.h",
    ],
    linkopts = ["-lm"],
    deps = [
            ":logging",
            ":process-tools",
    ],
    linkstatic = 1,
)

cc_binary(
    name = "admin",
    srcs = ["admin.cc"],
    deps = [":picosha2"],
    copts = ["-ftemplate-depth=1000000"],
    linkstatic = 1,
)

cc_binary(
    name = "admin_builder_client",
    srcs = ["admin_builder_client.cc"],
    copts = ["-fexceptions"],
    features = ["-use_header_modules"],
    deps = [":client_lib"],
    linkopts = ["-pthread"],
    linkstatic = 1,
)


cc_library(
    name = "picosha2",
    hdrs = ["picosha2.h"],
    copts = ["-ftemplate-depth=1000000"],
)

cc_proto_library(
    name = "execution_statistics_cc_proto",
    deps = [":execution_statistics_proto"],
)

proto_library(
    name = "execution_statistics_proto",
    srcs = ["execution_statistics.proto"],
)

cc_binary(
    name = "multiplexer",
    srcs = ["multiplexer.cc"],
    linkopts = ["-pthread"],
    copts = ["--std=c++17"],
    deps = [":subprocess"],
)
