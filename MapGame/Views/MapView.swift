//
//  MapView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    let overlay: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 35.2009086, longitude: -97.4470949),
        CLLocationCoordinate2D(latitude: 35.1997618, longitude: -97.4471083),
        CLLocationCoordinate2D(latitude: 35.1997519, longitude: -97.4442457),
        CLLocationCoordinate2D(latitude: 35.200913, longitude: -97.4442651),
        //CLLocationCoordinate2D(latitude: 35.2009086, longitude: -97.4470949),
    ]
    
    @ObservedObject var player: Player
    
    var body: some View {
        ZStack {
            Map {
                Marker(Waypoint.sample[3].name, coordinate: Waypoint.sample[3].asCoordinate())
                MapPolygon(coordinates: overlay)
                    .foregroundStyle(.gray.opacity(1))
            }
            .mapStyle(.standard(elevation: .realistic))
            VStack {
                StatsOverlayView(player: player)
                Spacer()
            }
        }
    }
}

#Preview {
    MapView(player: Player.sample[0])
}
