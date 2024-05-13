// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let release = "min.v6.0.0"

let frameworks = ["ffmpegkit": "f0adddd6f65c866156930a3164756864acc6a1b7cfeaa63e3cd5ec6604e09627",
                  "libavcodec": "a522866cf17d27558d4a6e56e893d1a8847292e09475c5ada59d28c81d408c0f",
                  "libavdevice": "9a5f91d1dbeff07cae1b10776e47dab36c65f5cb23dffd99dc43c7098faa89c1",
                  "libavfilter": "a4ab9b45fd1d3241b577a4924d19161607bf5c221cdaaabea94742afb0d59205",
                  "libavformat": "28ab1d356264314a3dba9d615f6adef0b0f7c950ee86c0cadf93ae16eaaccaf5",
                  "libavutil": "7b626f1903564c88aa58af4be814d5a25ec509651ced73e5329b01354bc1f5b6",
                  "libswresample": "65558dbacc653cc10eaf05aeb8a9078061e80a3fbdec876c60486a2039e935fc",
                  "libswscale": "91973da622f157d0d63aefecf08f07c91148aeb4ac738bb627dd6430703999eb"]

func xcframework(_ package: Dictionary<String, String>.Element) -> Target {
    let url = "https://github.com/artistic-mammoth/ffmpeg-kit-ios-spm/releases/download/\(release)/\(package.key).xcframework.zip"
    return .binaryTarget(name: package.key, url: url, checksum: package.value)
}

let package = Package(
    name: "ffmpeg-kit-ios-spm",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ffmpeg-kit-ios-spm",
            targets: ["ffmpeg-kit-ios-spm"]),
    ],
    targets: [
        .target(
            name: "ffmpeg-kit-ios-spm")
    ] + frameworks.map { xcframework($0) }
)
