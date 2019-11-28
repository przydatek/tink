load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

def tink_deps():
    # Basic rules we need to add to bazel.
    if not native.existing_rule("bazel_skylib"):
        # Release from 2019-10-09
        http_archive(
            name = "bazel_skylib",
            url = "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
        )

    # Google PKI certs for connecting to GCP KMS
    if not native.existing_rule("google_root_pem"):
        http_file(
            name = "google_root_pem",
            executable = 0,
            urls = ["https://pki.goog/roots.pem"],
            sha256 = "7f03c894282e3fc39105466a8ee5055ffd05e79dfd4010360117078afbfa68bd",
        )

    # wycheproof, for JSON test vectors
    if not native.existing_rule("wycheproof"):
        # Commit from 2018-07-31
        http_archive(
            name = "wycheproof",
            strip_prefix = "wycheproof-f89f4c53a8845fcefcdb9f14ee9191dbe167e3e3",
            url = "https://github.com/google/wycheproof/archive/f89f4c53a8845fcefcdb9f14ee9191dbe167e3e3.zip",
            sha256 = "b44bb0339ad149e6cdab1337445cf52440cbfc79684203a3db1c094d9ef8daea",
        )

    # proto
    # proto_library, cc_proto_library and java_proto_library rules implicitly depend
    # on @com_google_protobuf//:proto, @com_google_protobuf//:cc_toolchain and
    # @com_google_protobuf//:java_toolchain, respectively.
    # This statement defines the @com_google_protobuf repo.
    # Release from 2019-08-05
    if not native.existing_rule("com_google_protobuf"):
        http_archive(
            name = "com_google_protobuf",
            strip_prefix = "protobuf-3.9.1",
            url = "https://github.com/google/protobuf/archive/v3.9.1.zip",
            sha256 = "c90d9e13564c0af85fd2912545ee47b57deded6e5a97de80395b6d2d9be64854",
        )

    # Remote Build Execution
    if not native.existing_rule("bazel_toolchains"):
        # Latest 0.29 package for bazel 0.29.1; updated on 2019-10-31.
        http_archive(
            name = "bazel_toolchains",
            sha256 = "388da5cc148a43081c30c260ce1167747d8fb0968ee220e4ee1d1b1b8212eaa3",
            strip_prefix = "bazel-toolchains-0.29.9",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/0.29.9.tar.gz",
                "https://github.com/bazelbuild/bazel-toolchains/archive/0.29.9.tar.gz",
            ],
        )
