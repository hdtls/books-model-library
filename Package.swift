// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Books",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "Books", targets: ["Books"]),
        .library(name: "RxViewModel", targets: ["RxViewModel"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Moya/Moya.git", from: "14.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Books",
            dependencies: [
                .product(name: "Moya", package: "Moya"),
                "RxViewModel"
            ]
        ),
        .target(
            name: "RxViewModel",
            dependencies: []
        ),
        .testTarget(
            name: "BooksTests",
            dependencies: [
                "Books"
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
