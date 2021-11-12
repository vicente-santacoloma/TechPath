//
//  PathDetail.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import SwiftUI

struct PathDetail: View {
    
    @ObservedObject var path: Path
    
    private let percentFormat: FloatingPointFormatStyle<Double>.Percent = .percent.precision(.fractionLength(0))
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ScrollView {
                
                LazyVStack(alignment: .leading, spacing: 24) {
                    
                    HeroView(
                        element: path,
                        progress: path.progress,
                        geometry: geometry
                    )

                    if let about = path.about, !about.isEmpty {
                        
                        Divider()
                        
                        makeAboutSection(text: about)
                    }
                    
                    if let categorySkills = path.categorySkills, !categorySkills.isEmpty {
                        
                        Divider()
                        
                        makeProgressChart(categorySkills: categorySkills, geometry: geometry)
                        
                        makeSkillsSection(categorySkills: categorySkills, geometry: geometry)
                    }

                    if let badges = path.badges, !badges.isEmpty {
                    
                        Divider()
                        
                        makeBadgesSection(badges: badges)
                    }
                    
                    Divider()
                }
                .padding()
            }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
        .toolbar {
            
            Button {
                starOrUnstar()
            } label: {
                Image(systemName: path.hasStarred ? Icon.starFill.rawValue : Icon.star.rawValue)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    @ViewBuilder private func makeAboutSection(text: String) -> some View {
        SectionText(header: "About", text: text)
    }
    
    @ViewBuilder private func makeProgressChart(categorySkills: [CategorySkills], geometry: GeometryProxy) -> some View {
        
        Section {
            ProgressRingsChart(data: categorySkills.map({ ("\($0.category) (\(percentFormat.format($0.progress)))", $0.progress * 100) }), geometry: geometry)
                .foregroundColor(.darkBackground)
        } header: {
            Text("Progress")
                .font(.title2.bold())
                .padding(.bottom, 5)
        }
    }
    
    @ViewBuilder private func makeSkillsSection(categorySkills: [CategorySkills], geometry: GeometryProxy) -> some View {

        ElementsOverview(
            navigationTitle: "",
            sectionElements: categorySkills,
            destination: { skill in SkillDetail(skill: skill) },
            geometry: geometry
        )
    }
    
    @ViewBuilder private func makeBadgesSection(badges: [Path.Badge]) -> some View {
        
        Section {
            BadgesView(badges: badges)
        } header: {
            Text("Badges")
                .font(.title2.bold())
                .padding(.bottom, 5)
        }
    }
    
    private func starOrUnstar() {
        path.hasStarred.toggle()
    }
}

struct PathDetail_Previews: PreviewProvider {
    
    private static let repository: Repository = LocalRepository()
    
    static var previews: some View {
        
        let categoryPaths = Self.repository.getCategoryPaths()[0]
        let path = categoryPaths.paths[0]
        
        PathDetail(path: path)
            .preferredColorScheme(.dark)
    }
}
