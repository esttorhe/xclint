// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "xclint",
    dependencies: [
      .package(url: "https://github.com/xcodeswift/xcproj.git", .upToNextMinor(from: "0.3.0")),
      .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from: "0.7.1")),
    ],
    targets: [
      .target(
        name: "xclint",
        dependencies: [
          "xclintrules",
          "Commander"
        ]
      ),
      .target(
        name: "xclintrules",
        dependencies: []
      ),
      .testTarget(
        name: "xclintrulesTests",
        dependencies: [
          "xclintrules"
        ]
      )
    ],
    swiftLanguageVersions: [4]
)
