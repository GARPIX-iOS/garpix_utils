//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import UIKit

public extension String {
    /// Этот метод поможет вам форматировать строку с различными содержимым при помощи маски
    /// ```
    /// let text = "123FШ^"
    ///
    /// let formattedText = text.formatText(
    ///     mask: "(X-X-X) : X",
    ///     symbol: "X"
    /// ) // output "(1-2-3) : F"
    /// ```
    /// Также вы можете передать в метод inputType что позволит вам ограничить ввод пользователя только одним языком, только числами или спецсимволами (но тут нужно быть внимательнее потому что если вы указываете в маске спецсимволы и разрешаете их ввод через inputType то это может привести к некорректному поведению в функции
    ///
    /// ```
    /// let text = "123FШ^"
    ///
    /// let formattedText = text.formatText(
    ///     mask: "(X-X-X) : X",
    ///     symbol: "X",
    ///     inputType: StringInputType(
    ///         formatLanguage: .rus,
    ///         containsText: true,
    ///         containsNumbers: true,
    ///         containsSpecialSymbols: false
    ///     )
    /// ) // output "(1-2-3) : Ш"
    /// ```
    /// - Parameters:
    ///   - mask: пожалуйста, внимательно заполните маску и символы иначе функция может работать некорректно
    ///   - symbol: буквенный либо числовой символ
    ///   - inputType: структура в которой пользователь задает ограничения для текста а также его язык если вы не передадите ее в функцию то текст заменяться не будет, а только форматироваться при помощи маски.
    /// - Returns: форматированную строку
    func formatText(mask: String,
                    symbol: String.Element,
                    inputType: StringInputType? = nil) -> String {
        var result = ""
        var value = self
        let textReplacing = inputType?.calculateTextReplacing() ?? ""
        
        var index = value.startIndex
        value = replacingOccurrences(of: textReplacing, with: "", options: .regularExpression)
        
        /// проводим итерацию до тех пор пока все символы маски не будут заполнены
        for ch in mask where index < value.endIndex {
            if ch == symbol {
                /// здесь вместо "symbol" подставляется символ под текущим индексом
                result.append(value[index])
                
                /// переходим к следующему символу
                index = value.index(after: index)
                
            } else {
                /// добавляется символ маски ( например "-" или "(" )
                result.append(ch)
            }
        }
        return result
    }
    
    /// Функция для преобразования номера телефона в выбранный формат строки
    /// ```
    /// let formattedText = text.formatPhone() // output -> "+7 (999) 999-99-99"
    /// ```
    /// - Parameter mask: выбранный формат строки, по-умолчанию: "+Y (XXX) XXX-XX-XX"
    /// - Returns: номер телефона в нужном формате
    func formatPhone(with mask: String = "+Y (XXX) XXX-XX-XX") -> String {
        let numbers = replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        /// проводим итерацию до тех пор пока все символы маски не будут заполнены
        for ch in mask where index < numbers.endIndex {
            if ch == "Y" {
                /// здесь вместо "y" подставляется "7"
                result.append("7")
                /// переходим к следующему символу
                index = numbers.index(after: index)
            } else if ch == "X" {
                /// здесь вместо "х" подставляется символ под текущим индексом
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                /// добавляется символ маски ( например "-" или "(" )
                result.append(ch)
            }
        }
        return result
    }
}


// MARK: - StringToDate extensions

public extension String {
    /// Эта функция преобразует String в Date
    /// ```
    /// let date = text.stringToDate(dateFormat: .dayMonthDigitsYear) // output -> Date?
    /// ```
    /// - Parameter dateFormat: выбрать case из предоставленных значений перечислением
    /// - Returns: возвращает Date из String
    func stringToDate(dateFormat: DateFormats = .yearMonthDayWithDots) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self)
    }
}
