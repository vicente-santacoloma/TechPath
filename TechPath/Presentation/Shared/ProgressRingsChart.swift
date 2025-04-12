//
//  ProgressRingsChart.swift
//  TechPath
//
//  Created by Vicente Santacoloma on 11/12/2021.
//

import SwiftUI
import SwiftUICharts

struct ProgressRingsChart: View {
    @State var data: [(String, Double)]
    let geometry: GeometryProxy
    
    private let spacing: CGFloat = 12
    
    private let colorGradients = [
        ColorGradient(.blue, .purple),
        ColorGradient(.orange, .red),
        ColorGradient(.green, .yellow),
        ColorGradient(.blue, .cyan)
    ]
    
    private var chartSize: CGFloat {
       min(geometry.size.width * 0.3, geometry.size.width * 0.1 * CGFloat(data.count))
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            RingsChart()
                .data(data)
                .chartStyle(.init(backgroundColor: .clear, foregroundColor: colorGradients))
                .frame(width: chartSize, height: chartSize)
            
            VStack(alignment: .leading) {
                ForEach(0..<data.count) { dataIndex in
                    HStack {
                        Circle()
                            .fill(colorGradients[dataIndex].linearGradient(from: .top, to: .bottom))
                            .frame(width: 20, height: 20)
                        
                        Text(data[dataIndex].0)
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct ProgressRingsChart_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ProgressRingsChart(
                data: [("Programming Languages", 100), ("Development Tools", 90), ("Frameworks", 80), ("Libraries", 70)],
                geometry: geometry
            )
            .preferredColorScheme(.dark)
        }
    }
}
