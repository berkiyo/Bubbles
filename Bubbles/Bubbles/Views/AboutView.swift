//
//  AboutView.swift
//  Bubbles
//
//  Created by Berk Dogan on 28/5/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("About Bubbles")
                    .font(.title)
                    .bold()
                    .padding()
                
                Text("Bubbles is a simple and easy to use leveler app for iPhone and iPad.")
                    .padding()
                
                Spacer()
                
                Text("Version 1.0")
                    .padding()
                
                Spacer()
                
                Text("Made with ❤️ by Berk Dogan.")
                
                Spacer()
                
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
