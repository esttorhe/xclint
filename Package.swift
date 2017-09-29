// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "xclint",
    dependencies: [
      .package(url: "https://github.com/xcodeswift/xcproj.git", .upToNextMinor(from: "0.2.0")),
      .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from: "0.7.1")),
      .package(url: "https://github.com/onevcat/Rainbow", .upToNextMinor(from: "2.0.0")),
      .package(url: "https://github.com/JohnSundell/ShellOut.git", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
      .target(
        name: "xclint",
        dependencies: [
          "xclintcommands"
        ]
      ),
      .target(
        name: "xclintrules",
        dependencies: []
      ),
      .target(
        name: "xclintcommands",
        dependencies: [
          "xclintrules"
        ]
      )
      .testTarget(
        name: "xclintTests",
        dependencies: [
          "xclint"
        ]
      )
    ],
    swiftLanguageVersions: [3]
)
