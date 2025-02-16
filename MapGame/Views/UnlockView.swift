//
//  UnlockView.swift
//  MapGame
//
//  Created by Jace Rausch on 2/16/25.
//

import SwiftUI
import ConfettiSwiftUI

struct UnlockView: View {
    @Binding var isShowing : Bool
    
    @State private var trigger: Int = 0
    
    var body: some View {
        VStack {
            Button(action : doTrigger) {
                Text("New Area Unlocked!")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .confettiCannon(trigger: $trigger,  num: 100, confettis: [.text("📍"), .text("🗺️"), .text("🧭")], openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 180), radius: 500)
        
            Button(action : close) {
                Text("Close")
                    .font(.title2)
            }
        }
        .onAppear{trigger += 1}
    }
    
    func doTrigger() {
        trigger += 1
    }
    
    func close(){
        isShowing = false
    }
}

#Preview() {
    UnlockView(isShowing : .constant(true))
}
