//
//  Untitled.swift
//  MapGame
//
//  Created by Sam Bird on 16/02/2025.
//

import SwiftUI

struct AreaDetailView: View {
    @Binding var area: Area
    
    var body: some View {
        Text(area.name)
            .font(.title)
        Text(area.desc)
    }
}

#Preview {
    AreaDetailView(area: .constant(Area.emptyArea))
}
