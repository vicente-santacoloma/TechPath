//
//  PathsOverview.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 06/11/2021.
//

import SwiftUI

struct PathsOverview: View {
    
    @State var categoryPaths: [CategoryPaths]
    
    private let navigationTitle = "Paths"
    
    var body: some View {
        
        NavigationView {
                       
            GeometryReader { geometry in
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading, spacing: 24) {
                
                        ElementsOverview(
                            navigationTitle: navigationTitle,
                            sectionElements: categoryPaths,
                            destination: { path in PathDetail(path: path) },
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

//struct PathOverview_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        PathsOverview()
//    }
//}
