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
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @ObservedObject var locationManager = LocationManager()
    @State var isPresentingDiscoveryView = false
    @State var isPresentingUnlockedView = false
    @Binding var areas: [Area]
    @State var areaToPresent = Area.emptyArea
    @State var progress = 0.0
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                UserAnnotation()
                Marker(Waypoint.sample[3].name, coordinate: Waypoint.sample[3].asCoordinate())
                ForEach(areas) { area in
                    MapPolygon(coordinates: area.asMapCoords())
                        .foregroundStyle(.gray.opacity(area.mapOpacity))
                }
            }
            .mapStyle(.standard(elevation: .realistic))
            .safeAreaInset(edge: .bottom) {
                Button(action: {
                    unlockOrQueryArea()
                }) {
                    Text("Discover Area")
                        .padding(5)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
            }
            .safeAreaInset(edge: .top) {
                StatsOverlayView(progress: $progress)
            }
        }
        .onAppear {
            locationManager.checkLocationAuthorisation()
        }
        .sheet(isPresented: $isPresentingDiscoveryView) {
            NavigationView {
                AreaDetailView(area: $areaToPresent)
                    .navigationTitle("Presentation")
            }
        }
        .sheet(isPresented: $isPresentingUnlockedView) {
            Text("UnlockView")
        }
    }
    
    func unlockOrQueryArea() {
        locationManager.checkLocationAuthorisation()
        guard let coords = locationManager.lastKnownLocation else { return }
        
        var areaToFind: Area?
        
        for area in areas {
            let areaCoords = area.asMapCoords()
            if (MKPolygon(coordinates: areaCoords, count: areaCoords.count).isCoordinateInsidePolygon(coordinate: coords)) {
                areaToFind = area
            }
        }
        
        if var foundArea = areaToFind {
            areaToPresent = foundArea
            if foundArea.isDiscovered {
                isPresentingDiscoveryView = true
            } else {
                isPresentingUnlockedView = true
                guard let index = areas.firstIndex(where: {$0.id == foundArea.id}) else { return }
                areas[index].isDiscovered = true
            }
        }
    }
}

extension MKPolygon {
    func isCoordinateInsidePolygon(coordinate: CLLocationCoordinate2D) -> Bool {
        let polygonRenderer = MKPolygonRenderer(polygon: self)
        let currentMapPoint: MKMapPoint = MKMapPoint(coordinate)
        let polygonViewPoint: CGPoint = polygonRenderer.point(for: currentMapPoint)
        if polygonRenderer.path == nil {
            return false
        } else {
            return polygonRenderer.path.contains(polygonViewPoint)
        }
    }
}

#Preview {
    MapView(player: Player.sample[0], areas: .constant(Area.sample))
}
