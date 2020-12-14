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
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1"),
        .package(url: "https://github.com/Moya/Moya.git", from: "14.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.1.1"),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", from: "4.0.1"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "5.15.8")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Books",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
                .product(name: "RxDataSources", package: "RxDataSources"),
                "RxViewModel"
            ]
        ),
        .target(
            name: "RxViewModel",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "BooksTests",
            dependencies: [
                "Books",
                .product(name: "RxBlocking", package: "RxSwift"),
                .product(name: "RxTest", package: "RxSwift"),
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
