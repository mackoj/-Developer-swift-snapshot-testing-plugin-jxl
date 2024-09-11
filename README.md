# swift-snapshot-testing-plugin-jxl

This repo is an experimental use of this branch([mackoj:feat/imageSerializer](https://github.com/mackoj/swift-snapshot-testing/tree/feat/imageSerializer)) that contains a PluginAPI for `swift-snapshot-testing`.

The goal of this is to show how easy it is to build a plugin.

## Usage

- Add this project to dependencies inside your `Package.swift`  -> `.package(url: "https://github.com/mackoj/swift-snapshot-testing-plugin-jxl.git", revision: "0.0.2"),`.
- Then add this to your test target `.product(name: "JXLImageSerializer", package: "swift-snapshot-testing-plugin-jxl"),`.
- Then add this to the top of your test file `import JXLImageSerializer` and in the `setUp()` add this `SnapshotTesting.imageFormat = JXLImageSerializer.imageFormat`.

## TODO

- [ ] use [libjxl](https://github.com/libjxl/libjxl) instead of [JXLCoder]([url](https://github.com/awxkee/jxl-coder-swift.git)).
- [ ] make the API ready for Swift 6 and async/throwing functions
- [ ] create a tests suite
