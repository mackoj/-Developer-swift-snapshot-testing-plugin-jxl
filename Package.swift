// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-snapshot-testing-plugin-jxl",
  
  // TODO: update this with more tested platforms
  platforms: [
    .iOS(.v13),
    .macOS(.v12),
  ],

  products: [
    .library(
      name: "JXLImageSerializer",
      targets: ["JXLImageSerializer"]
    ),
  ],

  dependencies: [
    .package(url: "https://github.com/awxkee/jxl-coder-swift.git", from: "1.7.3"),
    .package(url: "https://github.com/mackoj/swift-snapshot-testing.git", revision: "b899f13"),
  ],

  targets: [
    .target(
      name: "JXLImageSerializer",
      dependencies: [
        .product(name: "ImageSerializationPlugin", package: "swift-snapshot-testing"),
        .product(name: "JxlCoder", package: "jxl-coder-swift"),
      ]
    ),
    .testTarget(
      name: "JXLImageSerializerTests",
      dependencies: ["JXLImageSerializer"]
    ),
  ]
)
