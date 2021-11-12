//
//  Topic.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 12/12/2021.
//

import Foundation

extension Skill {
    
    struct Topic: Codable, Nameable {
        
        let name: String
        var hasCompleted: Bool
        
//        enum CodingKeys: CodingKey {
//            case name, hasCompleted
//        }
//
//        required init(from decoder: Decoder) throws {
//
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//
//            name = try container.decode(String.self, forKey: .name)
//            hasCompleted = try container.decode(Bool.self, forKey: .hasCompleted)
//        }
//
//        func encode(to encoder: Encoder) throws {
//
//            var container = encoder.container(keyedBy: CodingKeys.self)
//
//            try container.encode(name, forKey: .name)
//            try container.encode(hasCompleted, forKey: .hasCompleted)
//        }
    }
}

extension Skill.Topic: Identifiable {
    var id: String { name }
}
