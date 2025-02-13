//
//  ViewMonthModel.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import Foundation
import SwiftUI

struct ViewMonth: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let viewCount: Int
    
    static func == (lhs: ViewMonth, rhs: ViewMonth) -> Bool {
        lhs.date == rhs.date && lhs.viewCount == rhs.viewCount
    }
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

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

var totalViews: Int {
    viewMonths.reduce(0, { $0 + $1.viewCount })
}
