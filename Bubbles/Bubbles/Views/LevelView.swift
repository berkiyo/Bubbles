//
//  ContentView.swift
//  Bubbles
//
//  Created by Berk Dogan on 28/5/2023.
//

import SwiftUI
import CoreMotion
import UIKit

import SwiftUI
import CoreMotion

struct LevelView: View {
    @ObservedObject var motionManager = MotionManager()
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("Leveler")
                    .font(.largeTitle)
                    .padding(.top, 50)
                
                Spacer()
                
                HStack {
                    LevelerIndicator(angle: CGFloat(motionManager.roll))
                        .padding()
                    LevelerIndicator(angle: CGFloat(motionManager.pitch).rounded(toPlaces: 2))
                        .padding()
                }// END HSTACK
                
                Spacer()
                
                HStack {
                    
                    LevelerLabel(title: "Roll", value: "\((motionManager.roll).rounded(toPlaces: 1))")
                    
                    LevelerLabel(title: "Pitch", value: "\((motionManager.pitch).rounded(toPlaces: 1))")
                } // END HSTACK
                .padding(.bottom, 50)
            } // END VSTACK
        } // END VIEW
    }
}

struct LevelerIndicator: View {
    var angle: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 20, height: 150)
            .foregroundColor(.accentColor)
            .rotationEffect(Angle(degrees: Double(angle)))
    }
}

struct LevelerLabel: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
            
            Text(value)
                .font(.title)
        }
        .padding(.horizontal, 20)
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
