// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "xcodeprojlint",
    targets: [
        Target(
          name: "xcodeprojlint",
          dependencies: ["xcodeprojlintcommands"]),
        Target(
          name: "xcodeprojlintrules",
          dependencies: []),
        Target(
          name: "xcodeprojlintcommands",
          dependencies: ["xcodeprojlintrules"])
    ],
    dependencies: [
        .Package(url: "https://github.com/carambalabs/xcodeproj.git", majorVersion: 0, minor: 0),
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0),
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 2),
        .Package(url: "https://github.com/JohnSundell/ShellOut.git", majorVersion: 1)
    ]
)
