//
//  Nameable.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import Foundation

protocol Nameable {
    var name: String { get }
    var initial: String { get }
}

extension Nameable {
    var initial: String {
        String(name.prefix(1))
    }
}
