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
    /// ```
    /// let text: String = date.dateToString(dateFormat: .dayMonthDigitsYear)
    /// ```
    /// - Parameter dateFormat: выбрать case из предоставленных значений перечислением
    /// - Returns: возвращает String из Date
    func dateToString(dateFormat: DateFormats) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
    
    /// Эта функция преобразует Date в String но безопаснее использовать dateToString(dateFormat: DateFormats) -> String
    /// ```
    /// let text: String = date.dateToString(formatedBy: "yyyy.MM.dd")
    /// ```
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
    
    /// Дата в формате "dd MMM yyyy"
    static var dd_MMMM_yyyy: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.dayMonthLetterYear.rawValue
        return formatter
    }
    
    /// Дата в формате "dd.MM.yyyy"
    static var ddMMyyyy: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.dayMonthDigitsYear.rawValue
        return formatter
    }
    
    /// Дата в формате "yyyy.MM.dd"
    static var yyyyMMdd: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yearMonthDayWithDots.rawValue
        return formatter
    }
    
    /// Дата в формате "yyyy-MM-dd"
    static var yyyyMMddLine: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yearMonthDayWithLine.rawValue
        return formatter
    }
    
    /// Дата в формате "yyyy-MM-dd'T'HH:mm:ss+hh:mm"
    static var serverTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.serverTime.rawValue
        return formatter
    }
    
    /// Дата в формате "dd MMM yyyy 'в' HH:mm"
    static var dd_MMM_yyyy_In_HHmm: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.dayMonthLetterYearAndTime.rawValue
        return formatter
    }
    
    /// Дата в формате "HH:mm"
    static var HHmm: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.timeWithDigits.rawValue
        return formatter
    }
    
    /// Дата в формате "yyyy-MM-dd HH:mm:ss"
    static var yyyyMMddHHmmss: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yearMonthDayWithLineAndTime.rawValue
        return formatter
    }
}
