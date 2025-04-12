//
//  ShapeStyle+Color.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 19/11/2021.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    static var ultraPink: Color {
        Color(red: 223 / 255, green: 90 / 255, blue: 127 / 255)
    }
    
    static var ultraPurple: Color {
        Color(red: 66 / 255, green: 63 / 255, blue: 128 / 255)
    }
}
