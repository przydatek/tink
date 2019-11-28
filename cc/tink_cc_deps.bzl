load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def tink_cc_deps():
    if not native.existing_rule("com_google_absl"):
        # LTS release from 2019-08-08
        http_archive(
            name = "com_google_absl",
            strip_prefix = "abseil-cpp-20190808",
            url = "https://github.com/abseil/abseil-cpp/archive/20190808.zip",
            sha256 = "0b62fc2d00c2b2bc3761a892a17ac3b8af3578bd28535d90b4c914b0a7460d4e",
        )

    if not native.existing_rule("boring_ssl"):
        # Commit from 2018-08-16
        http_archive(
            name = "boringssl",
            strip_prefix = "boringssl-18637c5f37b87e57ebde0c40fe19c1560ec88813",
            url = "https://github.com/google/boringssl/archive/18637c5f37b87e57ebde0c40fe19c1560ec88813.zip",
            sha256 = "bd923e59fca0d2b50db09af441d11c844c5e882a54c68943b7fc39a8cb5dd211",
        )

    if not native.existing_rule("com_google_googletest"):
        # GoogleTest/GoogleMock framework. Used by most C++ unit-tests.
        # Release from 2019-10-03
        http_archive(
            name = "com_google_googletest",
            strip_prefix = "googletest-1.10.x",
            url = "https://github.com/google/googletest/archive/v1.10.x.zip",
            sha256 = "54a139559cc46a68cf79e55d5c22dc9d48e647a66827342520ce0441402430fe",
        )

    if not native.existing_rule("rapidjson"):
        # Release from 2016-08-25; still the latest release on 2019-10-18
        http_archive(
            name = "rapidjson",
            url = "https://github.com/Tencent/rapidjson/archive/v1.1.0.tar.gz",
            sha256 = "bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e",
            strip_prefix = "rapidjson-1.1.0",
            build_file = "@tink_cc//:third_party/rapidjson.BUILD.bazel",
        )

    if not native.existing_rule("aws_cpp_sdk"):
        # Release from 2018-07-04
        http_archive(
            name = "aws_cpp_sdk",
            # Must be in sync with defines in third_party/aws_sdk_cpp.BUILD.bazel.
            url = "https://github.com/aws/aws-sdk-cpp/archive/1.4.80.tar.gz",
            strip_prefix = "aws-sdk-cpp-1.4.80",
            build_file = "@tink_cc//:third_party/aws_sdk_cpp.BUILD.bazel",
        )

    if not native.existing_rule("googleapis"):
        # Needed for Cloud KMS API via gRPC.
        # Commit from 2019-10-11
        http_archive(
            name = "googleapis",
            url = "https://github.com/googleapis/googleapis/archive/192d3d8221175f7cc0aa8eeac1d820f47c53da7f.zip",
            sha256 = "6b5a017082eade41c7efcc4d2f441422e41c0a0c57dd88e19d3ebfb1b8ff4f12",
            strip_prefix = "googleapis-192d3d8221175f7cc0aa8eeac1d820f47c53da7f",
            patches = ["@tink_cc//third_party:googleapis.patch"],
        )

    if not native.existing_rule("com_github_grpc_grpc"):
        # gRPC.
        # Release from 2019-08-15
        http_archive(
            name = "com_github_grpc_grpc",
            url = "https://github.com/grpc/grpc/archive/v1.22.1.tar.gz",
            sha256 = "cce1d4585dd017980d4a407d8c5e9f8fc8c1dbb03f249b99e88a387ebb45a035",
            strip_prefix = "grpc-1.22.1",
        )

    if not native.existing_rule("curl"):
        # Release from 2016-05-30
        http_archive(
            name = "curl",
            url = "https://mirror.bazel.build/curl.haxx.se/download/curl-7.49.1.tar.gz",
            sha256 = "ff3e80c1ca6a068428726cd7dd19037a47cc538ce58ef61c59587191039b2ca6",
            strip_prefix = "curl-7.49.1",
            build_file = "@tink_cc//:third_party/curl.BUILD.bazel",
        )

    if not native.existing_rule("zlib"):
        # Releaes from 2017-01-15; still most recent release on 2019-10-18
        http_archive(
            name = "zlib",
            url = "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
            sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
            strip_prefix = "zlib-1.2.11",
            build_file = "@tink_cc//:third_party/zlib.BUILD.bazel",
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
