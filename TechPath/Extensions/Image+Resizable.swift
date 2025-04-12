//
//  Image+Resizable.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 19/11/2021.
//

import Foundation
import SwiftUI

extension Image {
    func scaled() -> some View {
        resizable().scaledToFit()
    }
}
