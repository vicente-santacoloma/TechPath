//
//  SectionText.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 22/11/2021.
//

import SwiftUI

struct SectionText: View {
    
    let header: String
    let text: String

    var body: some View {
        Section {
            Text(text)
        } header: {
            Text(header)
                .font(.title2.bold())
//                .padding(.bottom, 5)
        }
    }
}

struct SectionText_Previews: PreviewProvider {
    static var previews: some View {
        SectionText(header: "Bar", text: "Foo")
    }
}
