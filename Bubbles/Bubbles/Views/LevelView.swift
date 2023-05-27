//
//  ContentView.swift
//  Bubbles
//
//  Created by Berk Dogan on 28/5/2023.
//

import SwiftUI
import CoreMotion


struct LevelView: View {
    @ObservedObject var motionManager = MotionManager()
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Bubbles App Demo")
                    .font(.title)
                    .bold()
                    .padding()
                
                Divider()
                    .padding()
                
                Text("X-Axis: \(motionManager.roll)")
                    .font(.title)
                
                Text("Y-Axis: \(motionManager.pitch)")
                    .font(.title)
                
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .overlay(
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                            .offset(x: CGFloat(motionManager.roll) * 90, y: CGFloat(motionManager.pitch) * 90)
                    )
            }
            .padding()
            // END VSTACK
        } // END ZSTACK
        
    }
}

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    
    @Published var roll: Double = 0.0
    @Published var pitch: Double = 0.0
    
    init() {
        setupMotionManager()
    }
    
    private func setupMotionManager() {
        motionManager.deviceMotionUpdateInterval = 0.1
        
        motionManager.startDeviceMotionUpdates(to: .main) { (motion, error) in
            guard let motion = motion, error == nil else {
                print("Failed to retrieve device motion data: \(error?.localizedDescription ?? "")")
                return
            }
            
            self.roll = motion.attitude.roll * 180 / .pi
            self.pitch = motion.attitude.pitch * 180 / .pi
        }
    }
}


struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
