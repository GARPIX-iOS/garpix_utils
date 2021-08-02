//
//  Date.swift
//  
//
//  Created by Anton Vlezko on 02.08.2021.
//

import Foundation

// MARK: - Date extension with Helper Functions
public extension Date {
    /// That function transform Date to String
    /// - Parameter dateFormat: select case from provided values by enum
    /// - Returns: Returns String from Date
    func dateToString(dateFormat: DateFormats) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
    
    /// That function transform Date to String
    /// - Parameter formatedBy: add your format string but if sth will goes wrong it will be your fault)
    /// - Returns: Returns string from Date
    func dateToString(formatedBy: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatedBy
        return formatter.string(from: self)
    }
}

// MARK: - DateFormatter extension with variables from DateFormats
public extension DateFormatter {
    static var dd_MMMM_yyyy: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.dayMonthLetterYear.rawValue
        return formatter
    }

    static var ddMMyyyy: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.dayMonthDigitsYear.rawValue
        return formatter
    }
    
    static var yyyyMMdd: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yearMonthDayWithDots.rawValue
        return formatter
    }
    
    static var yyyyMMddLine: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yearMonthDayWithLine.rawValue
        return formatter
    }
    
    static var serverTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.serverTime.rawValue
        return formatter
    }
    
    static var dd_MMM_yyyy_In_HHmm: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.dayMonthLetterYearAndTime.rawValue
        return formatter
    }
    
    static var HHmm: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.timeWithDigits.rawValue
        return formatter
    }
    
    static var yyyyMMddHHmmss: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yearMonthDayWithLineAndTime.rawValue
        return formatter
    }
}
