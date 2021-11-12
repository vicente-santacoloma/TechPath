//
//  CategoryPaths.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 12/12/2021.
//

import Foundation

class CategoryPaths: ObservableObject, Codable {
    
    let category: Path.Category
    @Published var paths: [Path]
    
    enum CodingKeys: CodingKey {
        case category, paths
    }
    
    init(category: Path.Category, paths: [Path]) {
        self.category = category
        self.paths = paths
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        category = try container.decode(Path.Category.self, forKey: .category)
        paths = try container.decode([Path].self, forKey: .paths)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(category, forKey: .category)
        try container.encode(paths, forKey: .paths)
    }
}

extension CategoryPaths: Categorizable {
    typealias Element = Path
    
    var elements: [Path] { paths }
}
