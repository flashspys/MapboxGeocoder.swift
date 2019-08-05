open class PlacemarkScope: OptionSet {
    public required init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public let rawValue: Int
    
    static let country = PlacemarkScope(rawValue: 1 << 1)
    static let region = PlacemarkScope(rawValue: 1 << 2)
    static let district = PlacemarkScope(rawValue: 1 << 3)
    static let postalCode = PlacemarkScope(rawValue: 1 << 4)
    static let place = PlacemarkScope(rawValue: 1 << 5)
    static let locality = PlacemarkScope(rawValue: 1 << 6)
    static let neighborhood = PlacemarkScope(rawValue: 1 << 7)
    static let address = PlacemarkScope(rawValue: 1 << 8)
    
    static let landmark = PlacemarkScope(rawValue: 1 << 10)
    static let pointOfInterest = PlacemarkScope(rawValue: PlacemarkScope.landmark.rawValue | (1 << 9))
    
    static let all = PlacemarkScope(rawValue: 0xffff)
}

extension PlacemarkScope: CustomStringConvertible {
    /**
     Initializes a placemark scope bitmask corresponding to the given array of string representations of scopes.
     */
    public convenience init?(descriptions: [String]) {
        var scope: PlacemarkScope = []
        for description in descriptions {
            switch description {
            case "country":
                scope.update(with: .country)
            case "region":
                scope.update(with: .region)
            case "district":
                scope.update(with: .district)
            case "postcode":
                scope.update(with: .postalCode)
            case "place":
                scope.update(with: .place)
            case "locality":
                scope.update(with: .locality)
            case "neighborhood":
                scope.update(with: .neighborhood)
            case "address":
                scope.update(with: .address)
            case "poi.landmark":
                scope.update(with: .landmark)
            case "poi":
                scope.update(with: .pointOfInterest)
            default:
                return nil
            }
        }
        self.init(rawValue: scope.rawValue)
    }
    
    public var description: String {
        var descriptions: [String] = []
        if contains(.country) {
            descriptions.append("country")
        }
        if contains(.region) {
            descriptions.append("region")
        }
        if contains(.district) {
            descriptions.append("district")
        }
        if contains(.postalCode) {
            descriptions.append("postcode")
        }
        if contains(.place) {
            descriptions.append("place")
        }
        if contains(.locality) {
            descriptions.append("locality")
        }
        if contains(.neighborhood) {
            descriptions.append("neighborhood")
        }
        if contains(.address) {
            descriptions.append("address")
        }
        if contains(.landmark) {
            descriptions.append(contains(.pointOfInterest) ? "poi" : "poi.landmark")
        }
        return descriptions.joined(separator: ",")
    }
}
