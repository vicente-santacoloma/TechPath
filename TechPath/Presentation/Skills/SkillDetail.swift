//
//  SkillDetail.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 20/11/2021.
//

import SwiftUI

struct SkillDetail: View {
    @ObservedObject var skill: Skill
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    HeroView(
                        element: skill,
                        progress: skill.quantity,
                        geometry: geometry
                    )
                    
                    Button {
                        skill.hasCompleted.toggle()
                    } label: {
                        Text(skill.hasCompleted ? "Completed" : "Complete")
                            .font(.headline)
                            .padding(5)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(skill.hasCompleted ? .green : .blue)
                    
                    if let about = skill.about, !about.isEmpty {
                        Divider()
                        
                        SectionText(header: "About", text: about)
                    }
                    
                    if let resources = skill.resources, !resources.isEmpty {
                        Divider()
                        
                        makeResourcesSection(resources: resources)
                    }
                    
                    if let paths = skill.paths, !paths.isEmpty {
                        Divider()
                        
                        makePathsSection(paths: paths)
                    }
                    
                    if !skill.topics.isEmpty {
                        Divider()
                        
                        makeTopicsSection()
                        
                    }
                }
                .padding()
            }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder private func makeTopicsSection() -> some View {
        Section {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(0..<skill.topics.count) { topicIndex in
                    Button {
                        skill.topics[topicIndex].hasCompleted.toggle()
                        
                        let topicsCompleted = Double(skill.topics.filter({ $0.hasCompleted }).count)
                        let topicsTotal = Double(skill.topics.count)
                        
                        skill.hasCompleted = (topicsCompleted == topicsTotal)
                        
                    } label: {
                        Text(skill.topics[topicIndex].name)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: Icon.checkmark.rawValue)
                            .foregroundColor(skill.topics[topicIndex].hasCompleted ? .blue : .gray)
                    }
                    .padding(10)
                    .background(.lightBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
        } header: {
            Text("Topics")
                .font(.title2.bold())
        }
    }
    
    @ViewBuilder private func makeResourcesSection(resources: [Skill.Resource]) -> some View {
        Section {
            LazyVStack(spacing: 10) {
                ForEach(resources) { resource in
                    Link(destination: resource.url!) {
                        ImageTextCell(
                            imageName: resource.imageName,
                            text: resource.name,
                            detailText: "",
                            size: 20
                        )
                    }
                }
            }
            
        } header: {
            Text("Resources")
                .font(.title2.bold())
        }
    }
    
    @ViewBuilder private func makePathsSection(paths: [Path]) -> some View {
        Section {
            LazyVStack(spacing: 10) {
                ForEach(paths) { path in
                    NavigationLink(destination:  Text(path.name)) {
                        ImageTextCell(
                            imageName: path.imageName,
                            text: path.name,
                            detailText: "",
                            size: 20
                        )
                    }
                }
            }
            
        } header: {
            Text("Contributes to paths")
                .font(.title2.bold())
        }
    }
}

struct SkillView_Previews: PreviewProvider {
    private static let repository: Repository = LocalRepository()
    
    static var previews: some View {
        let skills = repository.getSkills(by: "Programming Languages")
        let skill = skills.last!
        
        SkillDetail(skill: skill)
            .preferredColorScheme(.dark)
    }
}
