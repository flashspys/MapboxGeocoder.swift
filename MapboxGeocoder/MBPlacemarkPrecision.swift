//
//  MBPlacemarkPrecision.swift
//  MapboxGeocoder
//
//  Created by Felix Wehnert on 05.08.19.
//  Copyright © 2019 Mapbox. All rights reserved.
//

import Foundation

public enum PlacemarkPrecision: String {
    case building = "rooftop"
    case parcel
    case interpolated
    case intersection
    case street
}
