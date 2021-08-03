//
//  Date.swift
//  
//
//  Created by Anton Vlezko on 02.08.2021.
//

import Foundation

// MARK: - Date extension with Helper Functions
public extension Date {
    /// Эта функция преобразует Date в String
    /// - Parameter dateFormat: выбрать case из предоставленных значений перечислением
    /// - Returns: возвращает String из Date
    func dateToString(dateFormat: DateFormats) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
    
    /// Эта функция преобразует Date в String но безопаснее использовать dateToString(dateFormat: DateFormats) -> String
    /// - Parameter formatedBy: добавьте строку формата, но если что-то пойдет не так, это будет ваша вина)
    /// - Returns: возвращает String из Date
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
