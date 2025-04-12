//
//  DataSource.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 11/12/2021.
//

import Foundation

class DataSource {
    static let shared = DataSource()
    
    private static let bundle: Bundle = .main
    
    lazy var pathCategories: [Path.Category] = Self.bundle.decode("Path Categories.json")
    lazy var skillCategories: [Skill.Category] = Self.bundle.decode("Skill Categories.json")
    
    lazy var categoryPaths: [CategoryPaths] = {
        var categoryPaths = [CategoryPaths]()
        let pathsByCategory = pathsByCategory
        
        for category in pathCategories {
            guard let paths = pathsByCategory[category] else { continue }
            categoryPaths.append(CategoryPaths(category: category, paths: paths))
        }
        
        return categoryPaths
    }()
    
    lazy var categorySkills: [CategorySkills] = {
        var categorySkills = [CategorySkills]()
        let skillsByCategory = skillsByCategory
        
        for category in skillCategories {
            guard let skills = skillsByCategory[category] else { continue }
            categorySkills.append(CategorySkills(category: category, skills: skills))
        }
        
        return categorySkills
    }()

    lazy var pathsByCategory: [Path.Category: [Path]] = {
        
        var pathsByCategory = [Path.Category: [Path]]()
        
        for category in pathCategories {
            let paths = pathsByName.values.filter({ $0.category == category }).sorted(by: { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending })
            pathsByCategory[category] = paths
        }
        
        return pathsByCategory
    }()
    
    lazy var pathsByName: [String: Path] = {
        var paths = [String: Path]()
        
        return Self.shared.pathCategories.reduce(paths) { partialResult, category in
            var partialResult = partialResult
            var paths: [Path] = Self.bundle.decode("\(category).json")
            
            paths = paths.map({ path in
                path.category = category
                
                let file = "\(path.name).json"
                
                if Self.bundle.url(forResource: file, withExtension: nil) != nil {
                    let skillNamesByCategory: [Skill.Category: [String]] = Self.bundle.decode(file)
                    
                    let categorySkills: [CategorySkills] = skillNamesByCategory.map { category, skillNames in
                        let skills = skillNames.compactMap { skillsByName[$0] }
                        return CategorySkills(category: category, skills: skills)
                    }
                    
                    path.categorySkills = categorySkills
                    
                }
                
                return path
            })
            
            paths.forEach { path in
                partialResult[path.name] = path
            }
            
            return partialResult
        }
    }()
    
    lazy var skillsByCategory: [Skill.Category: [Skill]] = {
        var skillsByCategory = [Skill.Category: [Skill]]()
        
        for category in skillCategories {
            let skills = skillsByName.values.filter({ $0.category == category }).sorted(by: { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending })
            skillsByCategory[category] = skills
        }
        
        return skillsByCategory
    }()
    
    lazy var skillsByName: [String: Skill] = {
        var skills = [String: Skill]()
        
        return Self.shared.skillCategories.reduce(skills) { partialResult, category in
            var partialResult = partialResult
            var skills: [Skill] = Self.bundle.decode("\(category).json")
            
            skills = skills.map({ skill in
                var skill = skill
                skill.category = category
                return skill
            })
            
            skills.forEach { skill in
                partialResult[skill.name] = skill
            }
            
            return partialResult
        }
    }()
    
    private init() { }
}
