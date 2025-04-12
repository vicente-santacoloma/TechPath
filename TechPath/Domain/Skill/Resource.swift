//
//  Resource.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 12/12/2021.
//

import Foundation

extension Skill {
    
    class Resource: ObservableObject, Codable, Nameable, Imageable {
        let name: String
        let imageName: String?
        let url: URL?
        
        enum CodingKeys: CodingKey {
            case name, imageName, url
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            name = try container.decode(String.self, forKey: .name)
            imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
            url = try container.decodeIfPresent(URL.self, forKey: .url)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(name, forKey: .name)
            try container.encodeIfPresent(imageName, forKey: .imageName)
            try container.encodeIfPresent(url, forKey: .url)
        }
    }
}

extension Skill.Resource: Identifiable {
    var id: String { name }
}
