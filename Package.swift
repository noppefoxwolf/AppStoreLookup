// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppStoreLookup",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
        .package(url: "https://github.com/apple/swift-http-types", from: "1.4.0"),
    ],
    targets: [
        .executableTarget(
            name: "appstore-lookup",
            dependencies: [
                "LookupCore",
            ]
        ),
        .target(
            name: "LookupCore",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
            ]
        ),
        .testTarget(
            name: "LookupCoreTests",
            dependencies: [
                "LookupCore",
            ]
        )
    ]
)
