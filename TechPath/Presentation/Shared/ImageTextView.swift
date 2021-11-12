//
//  ImageTextView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 09/12/2021.
//

import SwiftUI

struct ImageTextView: View {
    
    let text: String
    let systemName: String?
    var imageSize: CGFloat = 40
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 24) {
            
            Spacer()
            
            if let systemName = systemName {
                
                Image(systemName: systemName)
                    .font(.system(size: imageSize))
                    .foregroundColor(.yellow)
            }
            
            Text(text)
                .font(.title3)
                .frame(maxWidth: .infinity)
            
            Spacer()
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding()
    }
}

struct ImageTextView_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageTextView(text: "Hello World!", systemName: "star")
    }
}
