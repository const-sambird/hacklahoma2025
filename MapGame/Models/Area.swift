//
//  Area.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import Foundation

struct Area: Codable, Identifiable {
    let vertices: [SIMD2<Double>]
    let id: String
    
    init(waypoint: Waypoint, vertices: [SIMD2<Double>]) {
        self.id = waypoint.id
        self.vertices = vertices
    }
}
