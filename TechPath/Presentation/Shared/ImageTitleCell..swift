//
//  ImageTextCell.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import SwiftUI

struct ImageTextCell: View {
    
    let imageName: String?
    let text: String
    let detailText: String
    var size: CGFloat = 40
    
    private var initial: String { String(text.prefix(1)) }
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10) {
            
            if let imageName = imageName, !imageName.isEmpty {
                Image(imageName)
                    .scaled()
                    .frame(width: size, height: size)
            } else if !initial.isEmpty  {
                LetterImage(letter: initial, size: size)
            }
            
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            Text(detailText)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(10)
        .background(.lightBackground)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(.lightBackground))
    }
}

struct ImageTitleCell__Previews: PreviewProvider {
    
    static var previews: some View {
        ImageTextCell(imageName: "Rust", text: "Rust Developer", detailText: "50%")
            .preferredColorScheme(.dark)
    }
}
