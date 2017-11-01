// swift-tools-version:4.0
//https://github.com/apple/swift-package-manager/blob/master/Documentation/PackageDescriptionV4.md
import PackageDescription

let package = Package(
    name: "xclint",
    dependencies: [
      .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from: "0.6.0")),
      .package(url: "https://github.com/kylef/PathKit.git", .upToNextMinor(from: "0.8.0")),
      .package(url: "https://github.com/xcodeswift/xcproj.git", .upToNextMinor(from: "1.3.0")),
      .package(url: "https://github.com/onevcat/Rainbow", .upToNextMinor(from: "3.0.0"))
    ],
    targets: [
      .target(
        name: "xclint",
        dependencies: [
          "xclintrules",
          "Commander",
          "Rainbow"
        ]
      ),
      .target(
        name: "xclintrules",
        dependencies: [
          "xcproj",
          "Rainbow"
        ]
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
