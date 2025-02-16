//
//  Player.swift
//  MapGame
//
//  Created by Sam Bird on 16/02/2025.
//

import Foundation

class Player: ObservableObject, Identifiable {
    @Published var id: UUID
    @Published var name: String
    @Published var score: Int
    
    init(id: UUID = UUID(), name: String, score: Int = 0) {
        self.id = id
        self.name = name
        self.score = score
    }
}

extension Player {
    static var sample: [Player] = [
        Player(name: "Sam", score: 100),
        Player(name: "Jace")
    ]
}
