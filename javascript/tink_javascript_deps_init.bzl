load("@tink//:tink_deps_init.bzl", "tink_deps_init")
load(
    "@io_bazel_rules_closure//closure:repositories.bzl",
    "rules_closure_dependencies",
    "rules_closure_toolchains",
)

def tink_javascript_deps_init():
    tink_deps_init()
    rules_closure_dependencies()
    rules_closure_toolchains()
