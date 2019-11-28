load("@tink//:tink_deps_init.bzl", "tink_deps_init")
load("@googleapis//:repository_rules.bzl", "switched_rules_by_language")
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

def tink_cc_deps_init():
    tink_deps_init()
    switched_rules_by_language(
        name = "com_google_googleapis_imports",
        cc = True,
        grpc = True,
    )
    grpc_deps()
