//
//  CCLocationCoordinate2D+Hashable.swift
//  MapGame
//
//  Created by Jace Rausch on 2/16/25.
//

import CoreLocation

struct HashableCoordinate: Hashable {
    var coordinate: CLLocationCoordinate2D

    func hash(into hasher: inout Hasher) {
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }

    static func == (lhs: HashableCoordinate, rhs: HashableCoordinate) -> Bool {
        return lhs.coordinate.latitude == rhs.coordinate.latitude &&
               lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}
