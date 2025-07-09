// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IrohaCrypto",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "IrohaCrypto", targets: ["IrohaCrypto"])
    ],
    targets: [
        .target(
            name: "IrohaCrypto",
            path: "IrohaCrypto/Classes",
            publicHeadersPath: ".", // all headers in Classes/* folders
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("..") // if needed
            ]
        )
    ]
)
