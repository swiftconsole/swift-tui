// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-tui",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTUI",
            targets: ["SwiftTUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftconsole/ansi.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "SwiftTUICore",
            dependencies: [
                .product(name: "ANSI", package: "ansi")
            ],
        ),
        .target(
            name: "SwiftTUI",
            dependencies: ["SwiftTUICore"],
        ),
        .testTarget(
            name: "SwiftTUITests",
            dependencies: ["SwiftTUI"]
        ),
        .testTarget(
            name: "SwiftTUICoreTests",
            dependencies: ["SwiftTUICore"]
        ),
    ]
)
