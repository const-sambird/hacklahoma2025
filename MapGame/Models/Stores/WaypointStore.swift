//
//  WaypointStore.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import Foundation

@MainActor
class WaypointStore : ObservableObject {
    @Published var waypoints: [Waypoint] = []
    
    public static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("waypoints.data")
    }
    
    func loadCached() async throws {
        let task = Task<[Waypoint], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let waypointsCached = try JSONDecoder().decode([Waypoint].self, from: data)
            return waypointsCached
        }
        
        let waypoints = try await task.value
        self.waypoints = waypoints
    }
}
