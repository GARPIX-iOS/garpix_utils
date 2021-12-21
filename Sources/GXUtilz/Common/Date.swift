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

public extension Numeric {
    /**
     Преобразует `Double&Int` в ₽

     Например:
     - Входные данные
     ```
     var employeeTotal: Double = 10.000
     var materialCosts: Int = 45.000
     ```
     Использование:
     ```
     Text(employeeTotal.getPrice())
     Text(materialCosts.getPrice())
     ```
     */
    func getPrice() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 0
        currencyFormatter.locale = Locale(identifier: "ru_RU")

        let price = self

        var nsPrice: NSNumber?

        if price is Double {
            nsPrice = NSNumber(value: price as! Double)
        }

        if price is Int {
            nsPrice = NSNumber(value: price as! Int)
        }

        if let price = nsPrice, let priceString = currencyFormatter.string(from: price) {
            return priceString
        }
        return ""
    }
}

public extension Date {
    /**
     Функция поможет когда необходимо отображать только год.
     - Warning: В случае `String` сначала надо будет его преобразовать в `Date` с помощью stringToDate.
     
     Например:
     - Входные данные
     ```
     var exampleDate: String = ""
     ```
     Использование:
     ```
     Text(exampleDate.stringToDate()?.formatDate() ?? "")
     ```
    */
    func formatDateToYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy")
        return dateFormatter.string(from: self)
    }
    
    
}

public extension Formatter {
    static let ruCurrency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        formatter.locale = .init(identifier: "ru_RU")
        formatter.numberStyle = .currency
        return formatter
    }()
}

public extension String {
    var double: Double? {
        Double(self)
    }
    /**
     Преобразует `String` в ₽

     Например:
     - Входные данные
     ```
     var price: String = "3434.00"
     ```
     Использование:
     ```
     Text(price.ruCurrencyFormatted)
     ```

     В результате получаем:
     ```
     3 434 ₽
     ```
     */
    var ruCurrencyFormatted: String {
        Formatter.ruCurrency.string(for: double) ?? Formatter.ruCurrency.string(for: 0) ?? ""
    }
}
