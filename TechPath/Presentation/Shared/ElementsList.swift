//
//  ElementsListView.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import SwiftUI

struct ElementsList<Element: Identifiable & Nameable & Imageable & Quantifiable, Destination: View>: View {
    let navigationTitle: String
    @State var elements: [Element]
    let destination: ((Element) -> Destination)
    
    @State var refresh: Bool = false
    
    @State private var searchText = ""
    
    var imageSize: CGFloat = 40
    
    private let percentFormat: FloatingPointFormatStyle<Double>.Percent = .percent.precision(.fractionLength(0))
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(searchText.isEmpty ? elements : elements.filter({ $0.name.localizedCaseInsensitiveContains(searchText) })) { element in
                    if refresh || !refresh {
                        NavigationLink(destination: destination(element)) {
                            ImageTextCell(
                                imageName: element.imageName,
                                text: element.name,
                                detailText: percentFormat.format(element.quantity),
                                size: imageSize
                            )
                        }
                    }
                }
            }
            .padding()
        }
        .searchable(text: $searchText)
        .background(.darkBackground)
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
        .onAppear {
            refresh.toggle()
        }
    }
}

//struct ElementsListView_Previews: PreviewProvider {
//    private static let repository: Repository = LocalRepository()
//
//    static var previews: some View {
//        let categorySkills = repository.getCategorySkills()[0]
//
//        ElementsList(
//            navigationTitle: categorySkills.category,
//            elements: categorySkills.skills,
//            destination: { _ in Text("Skill Detail") }
//        )
//    }
//}
