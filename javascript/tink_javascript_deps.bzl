load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def tink_javascript_deps():
    if not native.existing_rule("io_bazel_rules_closure"):
        # Last update: 2019-10-18, to latest release.
        http_archive(
            name = "io_bazel_rules_closure",
            sha256 = "7d206c2383811f378a5ef03f4aacbcf5f47fd8650f6abbc3fa89f3a27dd8b176",
            strip_prefix = "rules_closure-0.10.0",
            urls = [
                "https://github.com/bazelbuild/rules_closure/archive/0.10.0.tar.gz",
            ],
        )
