// swift-tools-version:5.1
import PackageDescription

#if os(Linux)
let libraryType: PackageDescription.Product.Library.LibraryType = .dynamic
#else
let libraryType: PackageDescription.Product.Library.LibraryType = .static
#endif

let package = Package(
    name: "GATT",
    products: [
        .library(
            name: "GATT",
            type: libraryType,
            targets: ["GATT"]
        ),
        .library(
            name: "DarwinGATT",
            type: libraryType,
            targets: ["DarwinGATT"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/blocks-lockers/Bluetooth.git",
            .branch("swift-5.6")
        )
    ],
    targets: [
        .target(name: "GATT", dependencies: ["Bluetooth"]),
        .target(name: "DarwinGATT", dependencies: ["GATT"])
    ]
)
