//
//  AreaStore.swift
//  MapGame
//
//  Created by Sam Bird on 16/02/2025.
//

import Foundation

@MainActor
class AreaStore: ObservableObject {
    @Published var areas: [Area] = []
    
    public static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("areas.data")
    }
    
    func load() async throws {
        let task = Task<[Area], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return Area.sample
            }
            let areas = try JSONDecoder().decode([Area].self, from: data)
            if areas.count == 0 {
                return Area.sample
            }
            return areas
        }
        
        let areas = try await task.value
        self.areas = areas
    }
    
    func save(areas: [Area]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(areas)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
