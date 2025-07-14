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
        ),
        // Optional: add a product for the CLI tool
        .executable(
            name: "ScryptHelperTool",
            targets: ["ScryptHelperTool"]
        )
    ],
    targets: [
        // ✅ C target for scrypt core
        .target(
            name: "ScryptC",
            path: "ScryptHelper/lib/scryptenc", // adjust if your .c files live elsewhere
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),

        .target(
            name: "lib-crypto",
            path: "ScryptHelper/libcperciva/crypto", // adjust if your .c files live elsewhere
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),

        .target(
            name: "lib-util",
            path: "ScryptHelper/libcperciva/util", // adjust if your .c files live elsewhere
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),

        // ✅ Swift tool (optional)
        .executableTarget(
            name: "ScryptHelperTool",
            dependencies: ["ScryptC", "lib-crypto", "lib-util"],
            path: "ScryptHelper",
            exclude: ["lib", "lib-platform", "libcperciva", "libscript-kdf", "m4", "tests"] // exclude all folders not related to Swift code
        ),

        // other crypto targets...
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
            dependencies: ["sr25519", "ed25519", "blake2", "IrohaCryptoImp", "Snorkel", "ScryptC"],
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
