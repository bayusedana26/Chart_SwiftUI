//
//  ContentView.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    @StateObject private var viewModel = ChartViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Youtube Views")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Total: \(viewModel.totalViews.formatted(.number))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Text("*Press the bar to see the details")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            ChartView(viewModel: viewModel)
                .frame(height: 450)
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
