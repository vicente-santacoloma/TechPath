//
//  LetterImage.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import SwiftUI

struct LetterImage: View {
    
    let letter: String
    var size: CGFloat = 40
    var font: Font = .title2.bold()
    var backgroundColor: Color = .darkBackground
    
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        Text(letter)
            .font(font)
            .foregroundColor(.white)
            .padding(size * 0.1)
            .frame(width: size, height: size)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

struct LetterImage_Previews: PreviewProvider {
    
    static var previews: some View {
        LetterImage(letter: "V")
    }
}
