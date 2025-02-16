//
//  Coordinate.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
