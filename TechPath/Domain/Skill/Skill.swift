//
//  Skill.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 06/11/2021.
//

import Foundation

class Skill: ObservableObject, Codable, Nameable, Imageable {
    typealias Category = String

    let name: String
    let imageName: String?
    let about: String?
    var category: Category?
    let paths: [Path]?
    let resources: [Resource]?
    @Published var topics: [Topic]
    
    @Published var hasCompleted: Bool {
        didSet {
            guard hasCompleted else { return }
            
            topics = topics.map({ topic in
                var topic = topic
                topic.hasCompleted = hasCompleted
                return topic
            })
        }
    }
    
    var progress: Double {
        guard !topics.isEmpty else { return hasCompleted ? 1 : 0 }
        
        let topicsCompleted = Double(topics.filter({ $0.hasCompleted }).count)
        let topicsTotal = Double(topics.count)
        
        return topicsCompleted / topicsTotal
    }
    
    enum CodingKeys: CodingKey {
        case name, imageName, about, category, paths, resources, topics, hasCompleted
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
        about = try container.decodeIfPresent(String.self, forKey: .about)
        category = try container.decodeIfPresent(Category.self, forKey: .category)
        paths = try container.decodeIfPresent([Path].self, forKey: .paths)
        resources = try container.decodeIfPresent([Resource].self, forKey: .resources)
        topics = try container.decode([Topic].self, forKey: .topics)
        hasCompleted = try container.decode(Bool.self, forKey: .hasCompleted)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(imageName, forKey: .imageName)
        try container.encodeIfPresent(about, forKey: .about)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(paths, forKey: .paths)
        try container.encodeIfPresent(resources, forKey: .resources)
        try container.encode(topics, forKey: .topics)
    }
}

extension Skill: Identifiable {
    var id: String { name }
}


extension Skill: Quantifiable {
    var quantity: Double { progress }
}

//extension CategorySkills: Equatable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.category == rhs.category && lhs.skills.elementsEqual(rhs.skills)
//    }
//}


//extension Skill: Equatable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.name == rhs.name && lhs.hasCompleted == rhs.hasCompleted && lhs.progress == rhs.progress && lhs.topics.elementsEqual(rhs.topics)
//    }
//}

//extension Skill.Topic: Equatable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.name == rhs.name && lhs.hasCompleted == rhs.hasCompleted
//    }
//}
