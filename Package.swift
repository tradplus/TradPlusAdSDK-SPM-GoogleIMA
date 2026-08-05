// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusGoogleIMAAdapter",
    platforms: [
        .iOS(.v12),
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
            .exact("15.12.0")
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git",
            .exact("3.27.4")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-GoogleIMA/releases/download/15.12.0/TPGoogleIMAAdapter-15.12.0.xcframework.zip",
            checksum: "da233e8787e48402c52b0fdc9fbfb5bcd2ee48a4b9607775c50756edab4c7113"
        ),
    ]
)
