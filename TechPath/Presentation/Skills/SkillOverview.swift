//
//  SkillsByCategoryView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 06/11/2021.
//

import SwiftUI

struct SkillOverview: View {
    @State var categorySkills: [CategorySkills]
    
    private let navigationTitle = "Skills"
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 24) {
                
                        ElementsOverview(
                            navigationTitle: navigationTitle,
                            sectionElements: categorySkills,
                            destination: { skill in SkillDetail(skill: skill) },
                            geometry: geometry
                        )
                    }
                    .padding()
                }
            }
            .navigationTitle(navigationTitle)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

//struct SkillOverview_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillOverview()
//    }
//}
