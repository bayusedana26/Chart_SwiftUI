//
//  ContentView.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import SwiftUI
import Charts

struct ContentView: View {
    // Properties
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2024, month: 1, day: 1), viewCount: 8000),
        .init(date: Date.from(year: 2024, month: 2, day: 1), viewCount: 22012),
        .init(date: Date.from(year: 2024, month: 3, day: 1), viewCount: 123071),
        .init(date: Date.from(year: 2024, month: 4, day: 1), viewCount: 42454),
        .init(date: Date.from(year: 2024, month: 5, day: 1), viewCount: 144000),
        .init(date: Date.from(year: 2024, month: 6, day: 1), viewCount: 60550),
        .init(date: Date.from(year: 2024, month: 7, day: 1), viewCount: 86600),
        .init(date: Date.from(year: 2024, month: 8, day: 1), viewCount: 80142),
        .init(date: Date.from(year: 2024, month: 9, day: 1), viewCount: 72454),
        .init(date: Date.from(year: 2024, month: 10, day: 1), viewCount: 53212),
        .init(date: Date.from(year: 2024, month: 11, day: 1), viewCount: 89212),
        .init(date: Date.from(year: 2024, month: 12, day: 1), viewCount: 81210),

    ]
    
    private var totalViews: Int {
        viewMonths.reduce(0, { $0 + $1.viewCount })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text("Youtube Views")
                .font(.title)
            
            Text("Total: \(totalViews.formatted(.number))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.bottom, 15.0)
            Chart {
                // Rule Mark
                RuleMark(y: .value("Goals", 100000))
                    .foregroundStyle(Color.red)
                    .lineStyle(StrokeStyle(lineWidth: 2.0, dash: [5]))
                    .annotation(alignment: .leading) {
                        Text("Goal")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                
                // Loop the viewMonths
                ForEach(viewMonths) { viewMonth in
                    BarMark(x: .value("Month", viewMonth.date, unit: .month),
                            y: .value("Views", viewMonth.viewCount)
                    )
                    .foregroundStyle(Color.green.gradient)
                    .cornerRadius(5.0)
                }
            }
            .frame(height: 200)
            .chartXAxis {
                AxisMarks(values: viewMonths.map { $0.date }) { date in
//                    AxisGridLine()
//                    AxisTick()
                    AxisValueLabel(format: .dateTime.month())
                }
            }
            .chartYAxis {
                AxisMarks { value in
                    AxisValueLabel()
                    AxisGridLine()
                }
            }
//            .chartXAxis(.hidden)
//            .chartYAxis(.hidden)
//            .chartPlotStyle { plotContent in
//                plotContent
//                    .background(Color.gray.opacity(0.2))
//                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
//            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
