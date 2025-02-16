//
//  MapView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI
import MapKit
import GLKit

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
                ForEach(Array(areas.enumerated()), id: \.element.id) { offset, item in
                    MapPolygon(coordinates: item.asMapCoords())
                        .foregroundStyle(.gray.opacity(item.mapOpacity))
                        .stroke(Color.blue, lineWidth: 1)
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
                    .navigationTitle("Area information")
            }
        }
        .sheet(isPresented: $isPresentingUnlockedView) {
            UnlockView(isShowing: $isPresentingUnlockedView, areaUnlocked: $areaToPresent)
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
        
        if let foundArea = areaToFind {
            areaToPresent = foundArea
            if foundArea.isDiscovered {
                isPresentingDiscoveryView = true
            } else {
                isPresentingUnlockedView = true
                guard let index = areas.firstIndex(where: {$0.id == foundArea.id}) else { return }
                areas[index].isDiscovered = true
            }
        }
        
        let completed = areas.filter { $0.isDiscovered }.count
        progress = Double(completed) / Double(areas.count)
    }
    
    func getCenterCoord(points: [CLLocationCoordinate2D]) -> CLLocationCoordinate2D{
        var x:Float = 0.0;
        var y:Float = 0.0;
        var z:Float = 0.0;
        for points in points {
            let lat = GLKMathDegreesToRadians(Float(points.latitude));
            let long = GLKMathDegreesToRadians(Float(points.longitude));
            
            x += cos(lat) * cos(long);
            
            y += cos(lat) * sin(long);
            
            z += sin(lat);
        }
        x = x / Float(points.count);
        y = y / Float(points.count);
        z = z / Float(points.count);
        let resultLong = atan2(y, x);
        let resultHyp = sqrt(x * x + y * y);
        let resultLat = atan2(z, resultHyp);
        let result = CLLocationCoordinate2D(latitude: CLLocationDegrees(GLKMathRadiansToDegrees(Float(resultLat))), longitude: CLLocationDegrees(GLKMathRadiansToDegrees(Float(resultLong))));
        return result;
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
