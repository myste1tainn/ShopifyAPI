// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ShopifyAPI",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "ShopifyAPI",
      targets: ["ShopifyAPI"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    
    .package(url: "https://github.com/myste1tainn/RxNetworking.git", from: "0.5.0"),
    
    .package(url: "https://github.com/ReactiveX/RxSwift", from: "4.5.0"),
    
    .package(url: "https://github.com/myste1tainn/RxQuickNimble", from: "0.1.0"),
    .package(url: "https://github.com/quick/Quick.git", from: "1.0.0"),
    .package(url: "https://github.com/quick/Nimble.git", from: "7.0.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "ShopifyAPI",
      dependencies: ["RxNetworking"]),
    .testTarget(
      name: "ShopifyAPITests",
      dependencies: ["ShopifyAPI", "RxQuickNimble", "Quick", "Nimble"]),
  ]
)
