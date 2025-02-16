//
//  LocationManager.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    @Published var errorFlag = false
    var manager = CLLocationManager()
    
    func checkLocationAuthorisation() {
        manager.delegate = self
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            errorFlag = true
        case .authorizedAlways, .authorizedWhenInUse:
            errorFlag = false
            lastKnownLocation = manager.location?.coordinate
        @unknown default:
            errorFlag = true
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorisation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.last?.coordinate
    }
}
