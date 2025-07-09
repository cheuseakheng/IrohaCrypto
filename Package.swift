// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IrohaCrypto",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "IrohaCrypto",
            targets: ["IrohaCrypto"]
        )
    ],
    targets: [
        .target(
            name: "IrohaCrypto",
            path: "IrohaCrypto/Classes",
            publicHeadersPath: ".",  // means headers are scattered inside Common/, BIP39/, etc.
            cSettings: [
                .headerSearchPath("Common"),
                .headerSearchPath("BIP39"),
                .headerSearchPath(".")
            ]
        )
    ]
)
