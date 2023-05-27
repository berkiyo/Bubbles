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
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Leveler")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                
                Spacer()
                
                HStack {
                    LevelerIndicator(angle: CGFloat(motionManager.roll))
                    LevelerIndicator(angle: CGFloat(motionManager.pitch))
                }
                
                Spacer()
                
                HStack {
                    LevelerLabel(title: "Roll", value: "\(motionManager.roll)", color: .yellow)
                    LevelerLabel(title: "Pitch", value: "\(motionManager.pitch)", color: .orange)
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct LevelerIndicator: View {
    var angle: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 10, height: 100)
            .foregroundColor(.white)
            .rotationEffect(Angle(degrees: Double(angle)))
    }
}

struct LevelerLabel: View {
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .foregroundColor(.white)
            
            Text(value)
                .font(.title)
                .foregroundColor(color)
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
