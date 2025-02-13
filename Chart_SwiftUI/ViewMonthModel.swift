//
//  ViewMonthModel.swift
//  Chart_SwiftUI
//
//  Created by Bayu Sedana on 12/02/25.
//

import Foundation
import SwiftUI

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)! 
    }
}
