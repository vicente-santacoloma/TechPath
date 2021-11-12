//
//  BadgesView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 22/11/2021.
//

import SwiftUI

struct BadgesView: View {
    
    let badges: [Path.Badge]
    
    var padding: CGFloat = 10
    var size: CGFloat = 50
    var spacing: CGFloat = 20
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: size), spacing: spacing)], spacing: spacing) {
            
            ForEach(badges) { badge in
                
                NavigationLink {
                    // TODO
                } label: {
                    Image(systemName: badge.symbol)
                        .resizable()
                        .scaledToFit()
                        .padding(padding)
                        .frame(width: size, height: size)
                        .background(badge.hasAchieved ? .blue : .gray)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct BadgesView_Previews: PreviewProvider {
    
    private static let badges = [
        Path.Badge(symbol: "applelogo"),
        Path.Badge(symbol: "iphone"),
        Path.Badge(symbol: "ipad"),
        Path.Badge(symbol: "desktopcomputer"),
        Path.Badge(symbol: "laptopcomputer"),
        Path.Badge(symbol: "applewatch"),
        Path.Badge(symbol: "appletv"),
    ]
    
    static var previews: some View {
        BadgesView(badges: badges)
    }
}
