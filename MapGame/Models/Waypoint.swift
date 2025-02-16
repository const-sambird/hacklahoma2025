//
//  Waypoint.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import Foundation
import MapKit

struct Waypoint: Codable, Identifiable {
    let latitude: Double
    let longitude: Double
    let name: String
    let id: String
    let quest: Quest
    
    init(id: String, latitude: Double, longitude: Double, name: String, quest: Quest = Quest()) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.quest = quest
    }
    
    func asCoordinate() -> CLLocationCoordinate2D {
        .init(latitude: self.latitude, longitude: self.longitude)
    }
}

extension Waypoint {
    static var sample: [Waypoint] = [
        Waypoint(id: "andrews-park", latitude: 35.223509, longitude: -97.447429, name: "Andrews Park"),
        Waypoint(id: "lloyd-noble-center", latitude: 35.187421, longitude: -97.444105, name: "Lloyd Noble Center"),
        Waypoint(id: "jimmie-austin-golf-club", latitude: 35.189606, longitude: -97.428579, name: "Jimmie Austin Golf Club"),
        Waypoint(id: "couch-restaurants", latitude: 35.200326, longitude: -97.445748, name: "Couch Restaurants")
    ]
}
