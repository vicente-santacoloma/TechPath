//
//  Badge.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 12/12/2021.
//

import Foundation

extension Path {
    
    class Badge: ObservableObject, Codable {
        
        let symbol: String
        @Published var hasAchieved: Bool
        
        enum CodingKeys: CodingKey {
            case symbol, hasAchieved
        }
        
        init(symbol: String, hasAchieved: Bool = false) {
            self.symbol = symbol
            self.hasAchieved = hasAchieved
        }
        
        required init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            symbol = try container.decode(String.self, forKey: .symbol)
            hasAchieved = try container.decode(Bool.self, forKey: .hasAchieved)
        }
        
        func encode(to encoder: Encoder) throws {
            
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(symbol, forKey: .symbol)
            try container.encode(hasAchieved, forKey: .hasAchieved)
        }
    }
}

extension Path.Badge: Identifiable {
    var id: String { symbol }
}
