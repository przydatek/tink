load("@tink//:tink_deps_init.bzl", "tink_deps_init")
load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@build_bazel_rules_android//android:rules.bzl", "android_sdk_repository")

def tink_java_deps_init():
    tink_deps_init()
    maven_install(
        artifacts = [
            "args4j:args4j:2.33",
            "com.amazonaws:aws-java-sdk-core:1.11.625",
            "com.amazonaws:aws-java-sdk-kms:1.11.625",
            "com.google.auto:auto-common:0.10",
            "com.google.auto.service:auto-service:1.0-rc6",
            "com.google.auto.service:auto-service-annotations:1.0-rc6",
            "com.google.api-client:google-api-client:1.22.0",
            "com.google.apis:google-api-services-cloudkms:v1-rev89-1.25.0",
            "com.google.code.findbugs:jsr305:3.0.1",
            "com.google.errorprone:error_prone_annotations:2.3.3",
            "com.google.http-client:google-http-client:1.31.0",
            "com.google.http-client:google-http-client-jackson2:1.31.0",
            "com.google.oauth-client:google-oauth-client:1.30.1",
            "com.google.truth:truth:0.42",
            "org.json:json:20170516",
            "joda-time:joda-time:2.10.3",
            "junit:junit:4.12",
            "org.mockito:mockito-core:2.23.0",
        ],
        repositories = [
            "https://jcenter.bintray.com/",
            "https://maven.google.com",
            "https://repo1.maven.org/maven2",
        ],
    )
    android_sdk_repository(
        name = "androidsdk",
        # Tink uses features in Android Keystore that are only supported at this
        # level or newer.
        # See https://developer.android.com/training/articles/keystore.html.
        api_level = 23,  # M
    )
