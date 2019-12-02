load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def tink_java_deps():
    if not native.existing_rule("rules_jvm_external"):
        # Release from 2019-08-14
        http_archive(
            name = "rules_jvm_external",
            strip_prefix = "rules_jvm_external-2.7",
            sha256 = "f04b1466a00a2845106801e0c5cec96841f49ea4e7d1df88dc8e4bf31523df74",
            url = "https://github.com/bazelbuild/rules_jvm_external/archive/2.7.zip",
        )

    if not native.existing_rule("build_bazel_rules_android"):
        # Last release from 2018-08-07.
        http_archive(
            name = "build_bazel_rules_android",
            urls = ["https://github.com/bazelbuild/rules_android/archive/v0.1.1.zip"],
            sha256 = "cd06d15dd8bb59926e4d65f9003bfc20f9da4b2519985c27e190cddc8b7a7806",
            strip_prefix = "rules_android-0.1.1",
        )

    if not native.existing_rule("com_google_protobuf_javalite"):
        # java_lite_proto_library rules implicitly depend on
        # @com_google_protobuf_javalite//:javalite_toolchain, which is the JavaLite proto
        # runtime (base classes and common utilities).
        # Commit from 2019-08-23 on the javalite branch.
        http_archive(
            name = "com_google_protobuf_javalite",
            strip_prefix = "protobuf-7b64714af67aa967dcf941df61fe5207975966be",
            urls = ["https://github.com/google/protobuf/archive/7b64714af67aa967dcf941df61fe5207975966be.zip"],
            sha256 = "311b29b8d0803ab4f89be22ff365266abb6c48fd3483d59b04772a144d7a24a1",
        )

    if not native.existing_rule("rules_python"):
        # Needed by @com_google_protobuf_javalite.
        http_archive(
            name = "rules_python",
            sha256 = "e5470e92a18aa51830db99a4d9c492cc613761d5bdb7131c04bd92b9834380f6",
            strip_prefix = "rules_python-4b84ad270387a7c439ebdccfd530e2339601ef27",
            urls = ["https://github.com/bazelbuild/rules_python/archive/4b84ad270387a7c439ebdccfd530e2339601ef27.tar.gz"],
        )
