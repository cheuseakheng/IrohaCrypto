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
            name: "sr25519",
            path: "sr25519Imp",
            publicHeadersPath: "include"
        ),
        .target(
            name: "blake2",
            path: "blake2Imp",
            publicHeadersPath: "include"
        ),
        .target(
            name: "ed25519",
            path: "ed25519Imp",
            publicHeadersPath: "include"
        ),
        .target(
            name: "IrohaCryptoImp",
            path: "IrohaCryptoImp",
            publicHeadersPath: "include"
        ),
        .target(
            name: "Snorkel",
            path: "SnorkelImp",
            publicHeadersPath: "include"
        ),
        .target(
            name: "IrohaCrypto",
            dependencies: ["sr25519", "ed25519", "blake2", "IrohaCryptoImp", "Snorkel"],
            path: "IrohaCrypto/Classes",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("BIP39"),
                .headerSearchPath("Common"),
                .headerSearchPath("Iroha"),
                .headerSearchPath("Scrypt"),
                .headerSearchPath("blake2"),
                .headerSearchPath("ed25519"),
                .headerSearchPath("secp256k1"),
                .headerSearchPath("sr25519"),
                .headerSearchPath("ss58")
            ]
        )
    ]
)
