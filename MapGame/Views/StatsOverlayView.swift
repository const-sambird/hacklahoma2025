//
//  StatsOverlayView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI

struct StatsOverlayView: View {
    @ObservedObject var player: Player
    
    var body: some View {
        HStack() {
            Spacer()
            VStack {
                Text("Points")
                    .font(.headline)
                Text("\(player.score)")
            }
            .padding()
            .background(.gray.opacity(0.9))
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    StatsOverlayView(player: Player.sample[0])
}
