//
//  Path.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 06/11/2021.
//

import Foundation

class Path: ObservableObject, Codable, Nameable, Imageable {
    
    typealias Category = String
    
    let name: String
    let imageName: String?
    let about: String?
    @Published var badges: [Badge]?
    var category: Category?
    @Published var categorySkills: [CategorySkills] = []
    @Published var hasStarred: Bool
    
    var progress: Double {
        guard !categorySkills.isEmpty else { return 0 }
        
        var progress: Double = 0
        var numSkills = 0
        
        categorySkills.forEach {
            progress += $0.skills.reduce(0.0) {  $0 + $1.progress }
            numSkills += $0.skills.count
        }
        
        return progress / Double(numSkills)
    }
    
    enum CodingKeys: CodingKey {
        case name, imageName, about, badges, category, hasStarred
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
        about = try container.decodeIfPresent(String.self, forKey: .about)
        badges = try container.decodeIfPresent([Badge].self, forKey: .badges)
        category = try container.decodeIfPresent(Category.self, forKey: .category)
        hasStarred = try container.decode(Bool.self, forKey: .hasStarred)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(imageName, forKey: .imageName)
        try container.encodeIfPresent(about, forKey: .about)
        try container.encodeIfPresent(badges, forKey: .badges)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encode(hasStarred, forKey: .hasStarred)
    }
}

extension Path: Identifiable {
    var id: String { name }
}

extension Path: Quantifiable {
    var quantity: Double { progress }
}

//extension Path: Equatable {
//
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.name == rhs.name && lhs.hasStarred == rhs.hasStarred
//    }
//}
