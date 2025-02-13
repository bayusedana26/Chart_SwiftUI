//
//  ChartViewModel.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import SwiftUI

// MARK: - ChartViewModel
final class ChartViewModel: ObservableObject {
    @Published var selectedDate: Date?
    let viewModels: [ViewMonth] = viewMonths
    
    var totalViews: Int {
        viewModels.reduce(0) { $0 + $1.viewCount }
    }
    
    var selectedMonth: ViewMonth? {
        guard let selectedDate = selectedDate else { return nil }
        return viewModels.first {
            Calendar.current.isDate(selectedDate, equalTo: $0.date, toGranularity: .month)
        }
    }
}
