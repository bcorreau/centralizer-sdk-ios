// swift-tools-version: 5.5
import PackageDescription

let package = Package(
  name: "centralizer-sdk-ios",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "centralizer-sdk-ios",
      targets: ["centralizer-sdk-ios"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/google/promises",
      .upToNextMajor(from: "2.3.1")
    ),
    .package(
        url: "https://github.com/acesso-io/unico-check-ios.git",
        from: "2.16.0"
    )
  ],
  targets: [
    .target(
      name: "centralizer-sdk-ios",
      dependencies: [
        .product(name: "Promises", package: "promises"),
        .product(name: "unicocheck-ios-spm", package: "unico-check-ios")
      ],
      resources: [
        .process("Resources")
      ],
      swiftSettings: [
        .define("INTERNAL")
      ]
    ),
    .testTarget(
      name: "centralizer-sdk-iosTests",
      dependencies: ["centralizer-sdk-ios"]
    ),
  ]
)