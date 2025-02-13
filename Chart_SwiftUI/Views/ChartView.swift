//
//  ChartView.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import SwiftUI
import Charts

// MARK: - ChartView
struct ChartView: View {
    @ObservedObject var viewModel: ChartViewModel
    
    var body: some View {
        VStack {
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
                
                // Loop through viewMonths
                ForEach(viewModel.viewModels) { data in
                    BarMark(
                        x: .value("Month", data.date, unit: .month),
                        y: .value("Views", data.viewCount)
                    )
                    .foregroundStyle(Color.green.gradient)
                    .opacity(isHighlighted(viewModel: data) ? 1 : 0.3)
                }
            }
            .chartXSelection(value: $viewModel.selectedDate)
            .chartXAxis {
                AxisMarks(values: viewModel.viewModels.map { $0.date }) { date in
                    AxisValueLabel(format: .dateTime.month())
                }
            }
            .chartYAxis {
                AxisMarks {
                    AxisValueLabel()
                    AxisGridLine()
                }
            }
            
            // Floating Detail Box for Selected Month
            if let selectedMonth = viewModel.selectedMonth {
                SelectedMonthView(selectedMonth: selectedMonth)
                    .transition(.opacity)
                    .animation(.easeInOut, value: selectedMonth)
            }
        }
    }
    
    // MARK: - Helper Function
    private func isHighlighted(viewModel: ViewMonth) -> Bool {
        guard let selected = self.viewModel.selectedMonth else { return true }
        return Calendar.current.isDate(viewModel.date, equalTo: selected.date, toGranularity: .month)
    }
}
