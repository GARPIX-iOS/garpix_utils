//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import UIKit

public extension String {
    /// Этот метод поможет вам форматировать строку с различными содержимым при помощи маски
    /// - Parameters:
    ///   - mask: пожалуйста, внимательно заполните маску и символы иначе функция может работать некорректно
    ///   - symbol: буквенный либо числовой символ
    ///   - inputType: структура в которой пользователь задает ограничения для текста а также его язык
    /// - Returns: форматированную строку
    func formatText(mask: String = "(X-X-X)",
                    symbol: String.Element = "X",
                    inputType: StringInputType?) -> String {
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

public extension String {
    /// Функция для получения существительного в нужном склонении при использовании с числительными
    /// например: 1 стул, 2 стула, 5 стульев
    /// - Parameters:
    ///   - declensions: здесь нужно указать слово в 3 склонениях (например: ["стул", "стула", "стульев"])
    ///   - int: числительное, вместе с которым будет склоняться существительное
    /// - Returns: существительное в нужном склонении
    func getWordFrom(declensions: [String], int: Int) -> String {
        var result = int % 100
        if result >= 10 && result <= 20 {
            return declensions[2]
        }
        result = int % 10
        switch result {
        case 1:
            return declensions[0]
        case 2, 3, 4 :
            return declensions[1]
        default:
            return declensions[2]
        }
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
