//
//  MapView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var csvParser = CSVParser()
    @ObservedObject var player: Player

    // Define the camera position using a region.
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.200904, longitude: -97.4470867),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    var body: some View {
        ZStack {
            // Use the new Map initializer that takes a MapContentBuilder.
            Map(position: $cameraPosition) {
                // Add a marker from sample data.
                Marker(Waypoint.sample[3].name, coordinate: Waypoint.sample[3].asCoordinate())
                
                // Add each polygon parsed from the CSV.
                ForEach(csvParser.polygons, id: \.self) { polygon in
                    MapPolygon(coordinates: polygon.map { $0.coordinate })
                        .foregroundStyle(.black.opacity(1))
                }
                
                // You can also add user location if needed:
                // UserAnnotation()
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
