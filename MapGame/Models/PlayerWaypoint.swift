//
//  PlayerWaypoint.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import Foundation

struct PlayerWaypoint: Codable, Identifiable {
    let waypoint: Waypoint
    var completed: Bool = false
    var id: String {
        get { return waypoint.id }
    }
    
    init(waypoint: Waypoint) {
        self.waypoint = waypoint
    }
}
