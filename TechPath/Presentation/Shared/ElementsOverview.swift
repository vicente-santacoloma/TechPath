//
//  ElementsOverview.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 21/11/2021.
//

import SwiftUI

struct ElementsOverview<CategoryElements: Categorizable, Destination: View>: View {
    let navigationTitle: String
    @State var sectionElements: [CategoryElements]
    let destination: ((CategoryElements.Element) -> Destination)
    let geometry: GeometryProxy
    
    @State var refresh: Bool = false
    
    var numberRows = 3
    var imageSize: CGFloat = 40
    var spacing: CGFloat = 10
    private let padding: CGFloat = 16
    private var minimumSize: CGFloat { imageSize + 2 * spacing }
    private let percentFormat: FloatingPointFormatStyle<Double>.Percent = .percent.precision(.fractionLength(0))
    
    var body: some View {
        ForEach(0..<sectionElements.count, id: \.self) { index in
            Divider()
            
            makeSectionHeader(sectionElements: sectionElements[index])
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rowGridItems(count: min(sectionElements[index].elements.count, numberRows)), spacing: 10) {
                    ForEach(sectionElements[index].elements) { element in
                        if refresh || !refresh {
                            NavigationLink(destination: destination(element)) {
                                ImageTextCell(
                                    imageName: element.imageName,
                                    text: element.name,
                                    detailText: percentFormat.format(element.quantity),
                                    size: imageSize
                                )
                                .frame(width: geometry.size.width - 2 * padding)
                            }
                        }
                    }
                }
            }
            .onAppear {
                refresh.toggle()
            }
        }
    }
    
    private func rowGridItems(count: Int) -> [GridItem] {
        Array(repeating: .init(.flexible(minimum: minimumSize), spacing: spacing), count: count)
    }
    
    @ViewBuilder private func makeSectionHeader(sectionElements: CategoryElements) -> some View {
        SectionHeader(
            text: sectionElements.category,
            destination: makeElementList(section: sectionElements.category, elements: sectionElements.elements),
            showingSeeAll: sectionElements.elements.count > numberRows
        )
    }
    
    @ViewBuilder private func makeElementList(section: String, elements: [CategoryElements.Element]) -> some View {
        ElementsList(navigationTitle: section, elements: elements, destination: destination)
    }
}

struct Overview_Previews: PreviewProvider {
    private static let repository: Repository = LocalRepository()
    
    static var previews: some View {
        GeometryReader { geometry in
            ElementsOverview(
                navigationTitle: "Paths",
                sectionElements: Self.repository.getCategoryPaths(),
                destination: { path in PathDetail(path: path) },
                geometry: geometry
            )
        }
        .preferredColorScheme(.dark)
    }
}
