//
//  CSVParser.swift
//  CSV_Converter
//
//  Created by Jace Rausch on 16/02/2025.
//

import Foundation
import CoreLocation

class CSVParser: ObservableObject {
    @Published var polygons: [[HashableCoordinate]] = []

    init() {
        loadCSV()
    }

    func loadCSV() {
        let content = "POLYGON ((-97.4470867 35.200904, -97.4470867 35.300904, -97.3470867 35.300904, -97.3470867 35.200904, -97.4470867 35.200904))"
        parseCSV(content: content)
    }


    func parseCSV(content: String) {
        let rows = content.components(separatedBy: "\n").dropFirst() // Skip headers
        
        for row in rows where !row.isEmpty {
            // Find the first comma to isolate the WKT field
            if let firstCommaIndex = row.firstIndex(of: ",") {
                var wktField = String(row[..<firstCommaIndex])
                // Trim any extra quotes and whitespace
                wktField = wktField.trimmingCharacters(in: .whitespacesAndNewlines)
                wktField = wktField.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
                
                if wktField.contains("POLYGON") {
                    let coordinates = extractCoordinates(from: wktField)
                    print("Polygon coordinates: \(coordinates)") // Debugging
                    polygons.append(coordinates)
                }
            }
        }
    }

    func extractCoordinates(from wkt: String) -> [HashableCoordinate] {
        // Remove the "POLYGON ((" prefix and "))" suffix.
        let trimmed = wkt
            .replacingOccurrences(of: "POLYGON ((", with: "")
            .replacingOccurrences(of: "))", with: "")
        // The coordinates are separated by comma and optional space.
        let pairs = trimmed.components(separatedBy: ", ")
        
        let coordinates = pairs.compactMap { pair -> HashableCoordinate? in
            let components = pair.components(separatedBy: " ")
            if components.count == 2,
               let lon = Double(components[0]),
               let lat = Double(components[1]) {
                print("Parsed coordinate: lat = \(lat), lon = \(lon)") // Debugging
                return HashableCoordinate(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            }
            return nil
        }
        return coordinates
    }
}
