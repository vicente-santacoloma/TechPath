//
//  HomeView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 06/11/2021.
//

import SwiftUI

struct HomeView: View {
    @State private var paths = Self.repository.getStarredPaths()
    
    private static let repository: Repository = LocalRepository()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                if paths.isEmpty {
                    makeImageTextView(geometry: geometry)
                } else {
                    TabView {
                        
                        ForEach(paths) { path in
                            PathDetail(path: path)
                        }
                    }
                    .tabViewStyle(.page)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .onAppear(perform: loadData)
        }
    }
    
    @ViewBuilder private func makeImageTextView(geometry: GeometryProxy) -> some View {
        ImageTextView(text: "You haven't starred any path yet", systemName: Icon.star.rawValue, imageSize: geometry.size.width * 0.2)
    }
    
    private func loadData() {
        paths = Self.repository.getStarredPaths()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
