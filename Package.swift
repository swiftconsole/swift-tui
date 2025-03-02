// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftTUI",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftTUI",
            targets: ["SwiftTUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/besya/ascii.git", from: "1.0.1"),
        .package(url: "https://github.com/besya/ansi.git", branch: "main"),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftTUICore",
            dependencies: [
                .product(name: "ASCII", package: "ASCII"),
                .product(name: "ANSI", package: "ANSI")
            ],
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
        .target(
            name: "SwiftTUI",
            dependencies: ["SwiftTUICore"],
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
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
