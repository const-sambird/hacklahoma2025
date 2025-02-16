//
//  ContentView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selected = "map"
    @ObservedObject var player: Player
    
    var body: some View {
        TabView(selection: $selected) {
            Tab("Map", systemImage: "map.fill", value: "map") {
                MapView(player: player)
            }
            Tab("Player", systemImage: "person.fill", value: "player") {
                PlayerView()
            }
        }
    }
}

#Preview {
    ContentView(player: Player.sample[0])
}
