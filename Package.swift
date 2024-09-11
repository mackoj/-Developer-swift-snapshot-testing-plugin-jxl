// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-snapshot-testing-plugin-jxl",
  platforms: [
    .iOS(.v13),
    .macOS(.v12),
    .tvOS(.v13),
    .watchOS(.v8),
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "JXLImageSerializer",
      targets: ["JXLImageSerializer"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/awxkee/jxl-coder-swift.git", from: "1.7.3"),
    .package(url: "https://github.com/mackoj/swift-snapshot-testing.git", revision: "2adc79a5120dfc7e96dace3c14a3cdc9ae429759"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
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
