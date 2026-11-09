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
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git",
            .exact("3.33.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-GoogleIMA/releases/download/15.18.0/TPGoogleIMAAdapter-15.18.0.xcframework.zip",
            checksum: "290c87ffc8ccc6536dc37fc1944de0828b47d11baabbb37bf1acd3890f8cfc9f"
        ),
    ]
)
