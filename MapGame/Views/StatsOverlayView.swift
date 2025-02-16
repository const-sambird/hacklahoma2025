//
//  StatsOverlayView.swift
//  MapGame
//
//  Created by Sam Bird on 15/02/2025.
//

import SwiftUI

struct StatsOverlayView: View {
    @Binding var progress: Double
    
    var body: some View {
        HStack() {
            VStack {
                Text("Progress")
                    .font(.headline)
                Text(String(format: "%.2f", progress * 100) + "%")
            }
            .padding()
            .background(.gray.opacity(0.9))
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    StatsOverlayView(progress: .constant(0.9))
}
