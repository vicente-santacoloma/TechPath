//
//  ProgressBar.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 11/12/2021.
//

import SwiftUI

struct ProgressBar: View {
    
    var progress: Double
    
    private let percentFormat: FloatingPointFormatStyle<Double>.Percent = .percent.precision(.fractionLength(0))
    
    private let opacity = 0.3
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        
        GeometryReader { geometry in
        
            ZStack(alignment: .center) {
            
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(opacity)
                        .foregroundColor(.blue)
                    
                    Rectangle()
                        .frame(width: progress * geometry.size.width, height: geometry.size.height)
                        .foregroundColor(.blue)
                    
                }
                
                Text(progress, format: percentFormat)
                    .foregroundColor(.white)
                    .font(.title2.bold())
            }
            .cornerRadius(cornerRadius)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {

    static var previews: some View {

        ProgressBar(progress: 0.5)
            .frame(height: 40)
            .preferredColorScheme(.dark)
    }
}
