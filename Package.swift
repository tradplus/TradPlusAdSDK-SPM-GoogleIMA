// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TradPlusGoogleIMAAdapter",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "TradPlusGoogleIMAAdapter",
            targets: ["TradPlusGoogleIMAAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git",
            .exact("3.32.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusGoogleIMAAdapter",
            dependencies: [
                .target(name: "TPGoogleIMAAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios"),
            ],
            path: ".",
            sources: ["Sources/TradPlusGoogleIMAAdapter/TradPlusGoogleIMAAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPGoogleIMAAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-GoogleIMA/releases/download/15.15.0/TPGoogleIMAAdapter-15.15.0.xcframework.zip",
            checksum: "68b9eecc2a86c5616695870710c6d8c4e63825a174352ff599b7dea64b82ab7b"
        ),
    ]
)
