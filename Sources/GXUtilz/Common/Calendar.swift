//
//  File.swift
//  
//
//  Created by Anton on 03.08.2021.
//

import Foundation

public extension Calendar {
    func periodBetweenDays(_ startDate: Date, _ endDate: Date, with components: Set<Calendar.Component>) -> Int? {
        let startDate = startOfDay(for: startDate)
        let endDate = startOfDay(for: endDate)
        let amountOfTime = dateComponents(components, from: startDate, to: endDate)
        switch components {
        case [.day]:
            return amountOfTime.day
        case [.month]:
            return amountOfTime.month
        case [.year]:
            return amountOfTime.year
        default: return 0
        }
    }
}
