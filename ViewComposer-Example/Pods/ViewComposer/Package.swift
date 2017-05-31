import PackageDescription

let package = Package(
    name: "ViewComposer",
    targets: [
        Target(name: "ViewComposer")
    ],
    dependencies: [
        .Package(url: "https://github.com/Sajjon/ViewComposer", majorVersion: 0, minor: 6)
    ]
)
