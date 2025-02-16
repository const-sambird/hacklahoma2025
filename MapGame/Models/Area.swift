//
//  Area.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit

struct Area: Codable, Identifiable {
    let vertices: [Coordinate]
    let id: String
    
    init(waypoint: Waypoint, vertices: [Coordinate]) {
        self.id = waypoint.id
        self.vertices = vertices
    }
    
    func asMapCoords() -> [CLLocationCoordinate2D] {
        var coordinates: [CLLocationCoordinate2D] = []
        for vertex in vertices {
            coordinates.append(CLLocationCoordinate2D(latitude: vertex.latitude, longitude: vertex.longitude))
        }
        return coordinates
    }
}

extension Area {
    static var sample: [Area] = [
        Area(waypoint: Waypoint.sample[3], vertices: [
            Coordinate(latitude: -97.4470949, longitude: 35.2009086),
            Coordinate(latitude: -97.4471083, longitude: 35.1997618),
            Coordinate(latitude: -97.4442457, longitude: 35.1997519),
            Coordinate(latitude: -97.4442651, longitude: 35.200913),
            Coordinate(latitude: -97.4470949, longitude: 35.2009086)
        ])
    ]
}
