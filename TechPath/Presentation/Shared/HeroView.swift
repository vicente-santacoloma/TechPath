//
//  HeroView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 22/11/2021.
//

import SwiftUI

struct HeroView<Element: Nameable & Imageable>: View {
    let element: Element
    
    var progress: Double
    
    let geometry: GeometryProxy
    
    let spacing: CGFloat = 20
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            if let imageName = element.imageName, !imageName.isEmpty {
                Image(imageName)
                    .scaled()
                    .frame(maxWidth: size(geometry: geometry), maxHeight: size(geometry: geometry))
            } else {
                LetterImage(letter: element.initial, size: size(geometry: geometry), font: Font.system(size: 60).bold(), backgroundColor: .lightBackground)
            }
            
            Text(element.name)
                .font(.title.bold())
            
            ProgressBar(progress: progress)
                .frame(height: 40)
        }
    }
    
    private func size(geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width * 0.3
    }
}

//struct HeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroView()
//    }
//}
