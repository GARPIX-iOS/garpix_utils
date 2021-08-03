//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import UIKit

public extension String {
    /// Этот метод поможет вам форматировать строку содержащую текст и числа
    /// - Parameters:
    ///   - mask: пожалуйста, внимательно заполните маску и символы иначе функция может работать некорректно
    ///   - letterSymbol: буквенный символ
    ///   - numberSymbol: численный символ
    ///   - formatLanguage: с помощью этого перечисления мы передаем в функцию строку с символами которые нужно заменять
    ///   - addSpecialSymbols: укажите false если вы хотите удалять специальные символы из строки после форматирования
    /// - Returns: форматированную строку
    func formatTextAndNumbers(with mask: String = "X 111 XX 111",
                              letterSymbol: String.Element = "X",
                              numberSymbol: String.Element = "1",
                              formatLanguage: FormatWithLanguage?,
                              addSpecialSymbols: Bool = true) -> String {
        var result = ""
        let value = replacingOccurrences(of: " ", with: "")
        var index = value.startIndex
        let numbersReplacing = "[^0-9]"
        let specialSymbols = " !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~].{8,}$"
        let text = formatLanguage?.textReplacing ?? "[^A-Za-zА-яа-я]"
        let textReplacing = addSpecialSymbols ? text + specialSymbols : text
        
        for ch in mask where index < value.endIndex {
            if ch == letterSymbol {
                result.append(String(value[index]).replacingOccurrences(of: textReplacing, with: "", options: .regularExpression))
                index = value.index(after: index)
            } else if ch == numberSymbol {
                result.append(String(value[index]).replacingOccurrences(of: numbersReplacing, with: "", options: .regularExpression))
                index = value.index(after: index)
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    /// Функция для преобразования номера телефона в выбранный формат строки
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
    
    /// Этот метод поможет вам форматировать строку содержащую текст или числа
    /// - Parameters:
    ///   - mask: пожалуйста, внимательно заполните маску и символы иначе функция может работать некорректно
    ///   - symbol: буквенный либо числовой символ
    ///   - onlyNumbers: показывает, может ли пользователь добавлять текст из .numpad или с выбранной клавиатуры
    ///   - formatLanguage: с помощью этого перечисления мы передаем в функцию строку с символами которые нужно заменять
    ///   - addSpecialSymbols: укажите false если вы хотите удалять специальные символы из строки после форматирования
    /// - Returns: форматированную строку
    func formatText(with mask: String,
                    symbol: String.Element,
                    onlyNumbers: Bool,
                    formatLanguage: FormatWithLanguage?,
                    addSpecialSymbols: Bool = true) -> String {
        var result = ""
        var value = self
        let numbersReplacing = "[^0-9]"
        let specialSymbols = " !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~].{8,}$"
        let text = formatLanguage?.textReplacing ?? "[^A-Za-zА-яа-я0-9]"
        let textReplacing = addSpecialSymbols ? text + specialSymbols : text

        // value iterator
        var index = value.startIndex

        if onlyNumbers {
            value = replacingOccurrences(of: numbersReplacing, with: "", options: .regularExpression)
        } else {
            value = replacingOccurrences(of: textReplacing, with: "", options: .regularExpression)
        }

        // iterate over the mask characters until the iterator of values ends
        for ch in mask where index < value.endIndex {
            if ch == symbol {
                // mask requires a value in this place, so take the next one
                result.append(value[index])

                // move values iterator to the next index
                index = value.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
}

// MARK: - StringToDate extensions

public extension String {
    /// Эта функция преобразует String в Date
    /// - Parameter dateFormat: выбрать case из предоставленных значений перечислением
    /// - Returns: возвращает Date из String
    func stringToDate(dateFormat: DateFormats = .yearMonthDayWithDots) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self)
    }
}
