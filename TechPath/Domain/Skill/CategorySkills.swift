//
//  CategorySkills.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 12/12/2021.
//

import Foundation

class CategorySkills: ObservableObject, Codable {
    
    var category: Skill.Category
    @Published var skills: [Skill]
    
    var progress: Double {
        guard !skills.isEmpty else { return 0 }
        
        let progress = skills.reduce(0.0) { $0 + $1.progress }
        
        return progress / Double(skills.count)
    }
    
    enum CodingKeys: CodingKey {
        case category, skills
    }
    
    init(category: Skill.Category, skills: [Skill]) {
        self.category = category
        self.skills = skills
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        category = try container.decode(Skill.Category.self, forKey: .category)
        skills = try container.decode([Skill].self, forKey: .skills)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(category, forKey: .category)
        try container.encode(skills, forKey: .skills)
    }
}

extension CategorySkills: Categorizable {
    typealias Element = Skill
    
    var elements: [Skill] { skills }
}
