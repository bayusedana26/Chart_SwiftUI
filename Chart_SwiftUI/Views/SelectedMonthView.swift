//
//  SelectedMonthView.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import SwiftUI

// MARK: - SelectedMonthView
struct SelectedMonthView: View {
    let selectedMonth: ViewMonth
    
    var body: some View {
        VStack {
            Text(selectedMonth.date, format: .dateTime.month(.wide))
                .font(.headline)
                .foregroundStyle(.primary)
            
            Text("\(selectedMonth.viewCount.formatted(.number)) views")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.green)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 4)
    }
}
