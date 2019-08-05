// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "MapboxGeocoder",
    platforms: [.iOS(.v9)],
    products: [
        .library(name: "MapboxGeocoder", targets: ["MapboxGeocoder"])
    ],
    targets: [
        .target(
            name: "MapboxGeocoder",
            path: "MapboxGeocoder",
            exclude: ["Geocoder Example"]
        ),
        .testTarget(
            name: "MapboxGeocoderTests",
            dependencies: ["MapboxGeocoder"],
            path: "MapboxGeocoderTests",
            exclude: ["Geocoder Example"]
        )
    ]
)
