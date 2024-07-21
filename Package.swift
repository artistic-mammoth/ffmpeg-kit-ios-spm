// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let release = "v6.0.mingpl"

let frameworks = ["ffmpegkit": "0f209b25450c129d17a44de157aa73e349c651d3ddd105691a9ffedea53137c9",
                  "libavcodec": "9d35c9787aaf13c070854349e98279c46e672f19f6f5bcbf7f3dae8854acf854",
                  "libavdevice": "c269e0d222d23a73e18aeea511cb02ff052cf23850ab1555a66bc5acb8aecc26",
                  "libavfilter": "9a9bd8b47c29d0897d6559f7a0a5fdbfb0d75acb6c226ed8e1cb491ad20e52ac",
                  "libavformat": "131c734fb8a3502db7961e16c6f020650a143182bc0e72e8ac0cb8fbb1442786",
                  "libavutil": "f8bc692dc21a94ab6c95b305941464f1891c4b3e71142d079bec3075cdf1be9a",
                  "libswresample": "ed3f8903903794b2f74555d17f243d7b6036b870da4a589f2b167a2670fb0155",
                  "libswscale": "7e2fb1056befb1a1e5ee2d4c2295b219de8db67d02f95975a3244f7192037a98"]

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
            name: "ffmpeg-kit-ios-spm",
            dependencies: frameworks.map { .byName(name: $0.key) })
    ] + frameworks.map { xcframework($0) }
)
