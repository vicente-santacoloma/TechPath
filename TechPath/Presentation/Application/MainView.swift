//
//  MainView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 05/11/2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: Icon.TabBar.home.rawValue)
                }

            SkillsView()
                .tabItem {
                    Label("Skills", systemImage: Icon.TabBar.skills.rawValue)
                }

            PathsView()
                .tabItem {
                    Label("Paths", systemImage: Icon.TabBar.paths.rawValue)
                }
                        
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: Icon.TabBar.settings.rawValue)
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
