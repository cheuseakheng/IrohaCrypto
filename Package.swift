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
                .headerSearchPath("BIP39"),
                .headerSearchPath("Common"),
                .headerSearchPath("Iroha"),
                .headerSearchPath("Scrypt"),
                .headerSearchPath("blake2"),
                .headerSearchPath("ed25519"),
                .headerSearchPath("secp256k1"),
                .headerSearchPath("sr25519"),
                .headerSearchPath("ss58"),
                .headerSearchPath(".")
            ]
        )
    ]
)
