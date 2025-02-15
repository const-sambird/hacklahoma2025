//
//  ContentView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Map {
            Annotation("Devon Energy Hall", coordinate: CLLocationCoordinate2D(latitude: 35.210752, longitude: -97.441813)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.yellow)
                    Text("⁉️")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
