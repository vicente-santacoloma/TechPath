//
//  Repository.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 20/11/2021.
//

import Foundation

protocol Repository {
    
    func getPathCategories() -> [Path.Category]
    func getPath(by name: String) -> Path
    func getPaths(by category: Path.Category) -> [Path]
    
    func getCategoryPaths() -> [CategoryPaths]
    func getCategorySkills() -> [CategorySkills]
    
    func getSkillCategories() -> [Skill.Category]
    func getSkill(by name: String) -> Skill
    func getSkills(by category: Skill.Category) -> [Skill]
    
    func getStarredPaths() -> [Path]
}
