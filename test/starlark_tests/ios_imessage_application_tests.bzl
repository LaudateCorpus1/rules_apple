# Copyright 2019 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""ios_imessage_application Starlark tests."""

load(
    ":rules/infoplist_contents_test.bzl",
    "infoplist_contents_test",
)

def ios_imessage_application_test_suite():
    """Test suite for ios_extension."""
    name = "ios_imessage_application"

    infoplist_contents_test(
        name = "{}_plist_test".format(name),
        target_under_test = "//test/starlark_tests/targets_under_test/ios:imessage_app",
        expected_values = {
            "BuildMachineOSBuild": "*",
            "CFBundleExecutable": "imessage_app",
            "CFBundleIdentifier": "com.google.example",
            "CFBundleName": "imessage_app",
            "CFBundleSupportedPlatforms:0": "iPhone*",
            "DTCompiler": "com.apple.compilers.llvm.clang.1_0",
            "DTPlatformBuild": "*",
            "DTPlatformName": "iphone*",
            "DTPlatformVersion": "*",
            "DTSDKBuild": "*",
            "DTSDKName": "iphone*",
            "DTXcode": "*",
            "DTXcodeBuild": "*",
            "LSApplicationLaunchProhibited": "true",
            "MinimumOSVersion": "10.0",
            "UIDeviceFamily:0": "1",
        },
        tags = [name],
    )

    native.test_suite(
        name = name,
        tags = [name],
    )