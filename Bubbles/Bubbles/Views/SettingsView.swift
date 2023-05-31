//
//  SettingsView.swift
//  Bubbles
//
//  Created by Berk Dogan on 28/5/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        // Guide View
                        /*
                        NavigationLink { GuideView() } label: {
                            Text("❓ How To Guide")
                        }
                        */
                        
                        // Pro View
                        // Removed, will probably add it in a later version.
                        /*
                         NavigationLink { ProView() } label: {
                         Text("💎 Infinity Pro")
                         }
                         
                         */
                        
                        // Icon Changer View
                        // Pro Feature
                        NavigationLink { ChangeAppIconView() } label: {
                            Text("📱 Change App Icon")
                        }
                        
                        
                        // Apple Watch Complications View
                        // For future release
                        /*
                         NavigationLink { AppleWatchView() } label: {
                         Text("⌚️ Apple Watch (Coming soon)")
                         }
                         .disabled(true)
                         */
                        
                        // About View
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Bubbles")
                        }
                        
                        
                        // Feedback Hyperlink (Email)
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:mail@berkdogan.com")!)
                        
                        
                        // Review prompt
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }

                        
                        
                    } // END LIST
                } // END NAVSTACK
            } // END VSTACK
        } // END ZSTACK
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
