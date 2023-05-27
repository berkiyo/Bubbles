//
//  HomeView.swift
//  Bubbles
//
//  Created by Berk Dogan on 28/5/2023.
//

import SwiftUI


/**
 Begin "HomeView"
 */
struct HomeView: View {
    
    @State var selection = 1 // by default, go with
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            
            LevelView()
                .tabItem {
                    Label("Leveler", systemImage: "level")
                }
                .tag(1)
            
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)

        }
        .navigationTitle(selection == 1 ? "Leveler" : "Settings")
        .navigationBarTitleDisplayMode(.inline)// << here !!
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
