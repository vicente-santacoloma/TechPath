//
//  Categorizable.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import Foundation

protocol Categorizable: ObservableObject {
    associatedtype Element: Identifiable & Nameable & Imageable & Quantifiable
    
    var category: String { get }
    var elements: [Element] { get }
}
