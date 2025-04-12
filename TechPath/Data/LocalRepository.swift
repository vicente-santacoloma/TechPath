//
//  LocalRepository.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 20/11/2021.
//

import Foundation

class LocalRepository: Repository {
    private let dataSource = DataSource.shared
    
    private let bundle: Bundle = .main
    private let userDefaults: UserDefaults = .standard
    
    func getPathCategories() -> [Path.Category] {
        dataSource.pathCategories
    }
    
    func getPath(by name: String) -> Path {
        dataSource.pathsByName[name]!
    }
    
    func getPaths(by category: Path.Category) -> [Path] {
        return dataSource.pathsByCategory[category] ?? []
    }
    
    func getCategoryPaths() -> [CategoryPaths] {
        dataSource.categoryPaths
    }
    
    func getCategorySkills() -> [CategorySkills] {
        dataSource.categorySkills
    }

    func getSkillCategories() -> [Skill.Category] {
        dataSource.skillCategories
    }
    
    func getSkill(by name: String) -> Skill {
        dataSource.skillsByName[name]!
    }
    
    func getSkills(by category: Skill.Category) -> [Skill] {
        dataSource.skillsByCategory[category] ?? []
    }
    
    func getStarredPaths() -> [Path] {
        dataSource.pathsByName.values.filter({ $0.hasStarred }).sorted(by: { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending })
    }
}
