//
//  SettingsView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 06/11/2021.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                
            }
            .navigationTitle("Settings")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView()
    }
}
