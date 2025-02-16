//
//  MapGameApp.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI

@main
struct MapGameApp: App {
    @StateObject private var areaStore = AreaStore()
    @StateObject private var waypointStore = WaypointStore()
    @StateObject private var playerStore = PlayerStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(player: Player.sample[0], areas: $areaStore.areas) {
                Task {
                    do {
                        try await areaStore.save(areas: areaStore.areas)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await areaStore.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
