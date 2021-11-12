//
//  SectionHeader.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 14/11/2021.
//

import SwiftUI

struct SectionHeader<Destination>: View where Destination: View {
    
    let text: String
    let destination: Destination
    var showingSeeAll = true
    
    var body: some View {
            
        HStack(alignment: .center) {
            Text(text)
                .font(.title2.bold())
            
            Spacer()
            
            if showingSeeAll {
                NavigationLink(destination: destination) {
                    Text("See All")
                }
            }
        }
    }
}

//struct SectionHeader_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let category = PathCategory(name: "Mobile Development", paths: [
//            Path(name: "iOS Developer", iconName: "apple"),
//            Path(name: "Android Developer", iconName: "android"),
//            Path(name: "Flutter Developer", iconName: "flutter"),
//        ])
//        
//        SectionHeader(text: "Hello World", destination: PathsView(category: category))
//    }
//}
