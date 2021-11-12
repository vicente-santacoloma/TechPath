//
//  MainView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 05/11/2021.
//

import SwiftUI

struct MainView: View {
    
    @State var categoryPaths: [CategoryPaths] = Self.repository.getCategoryPaths()
    @State var categorySkills: [CategorySkills] = Self.repository.getCategorySkills()
    
    private static let repository: Repository = LocalRepository()
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: Icon.TabBar.home.rawValue)
                }

            SkillOverview(categorySkills: categorySkills)
                .tabItem {
                    Label("Skills", systemImage: Icon.TabBar.skills.rawValue)
                }

            PathsOverview(categoryPaths: categoryPaths)
                .tabItem {
                    Label("Paths", systemImage: Icon.TabBar.paths.rawValue)
                }
                        
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: Icon.TabBar.settings.rawValue)
                }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
