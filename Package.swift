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
      name: "swift-snapshot-testing-plugin-jxl",
      targets: ["swift-snapshot-testing-plugin-jxl"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/awxkee/jxl-coder-swift.git", from: "1.7.3"),
    .package(path: "../swift-snapshot-testing"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "swift-snapshot-testing-plugin-jxl",
      dependencies: [
        .product(name: "ImageSerializationPlugin", package: "swift-snapshot-testing"),
        .product(name: "JxlCoder", package: "jxl-coder-swift"),
      ]
    ),
    .testTarget(
      name: "swift-snapshot-testing-plugin-jxlTests",
      dependencies: ["swift-snapshot-testing-plugin-jxl"]
    ),
  ]
)
