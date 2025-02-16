//
//  MapGameApp.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI

@main
struct MapGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(player: Player.sample[0])
        }
    }
}
