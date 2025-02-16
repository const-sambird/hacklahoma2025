//
//  PlayerView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI

struct PlayerView: View {
    @State private var editingName = ""
    @State var editingDOB = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Player details")) {
                List {
                    TextField("Your name", text: $editingName)
                }
            }
            Section(header: Text("Friends")) {
                
            }
            Section(header: Text("Leaderboard")) {}
        }
    }
}

#Preview {
    PlayerView()
}
