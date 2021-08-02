//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import UIKit

public extension String {
    /// This method will help to you to transform text as vehicle Gov Number
    /// - Parameters:
    ///   - mask: mask pls check symbols properly
    ///   - letterSymbol: letters of number
    ///   - numberSymbol: numbers of number
    ///   - formatLanguage: language of number
    /// - Returns: formatted string
    func formatGovNumber(with mask: String = "X 111 XX 111",
                         letterSymbol: String.Element = "X",
                         numberSymbol: String.Element = "1",
                         formatLanguage: FormatWithLanguage = .rus) -> String {
        var result = ""
        let value = replacingOccurrences(of: " ", with: "")
        var index = value.startIndex
        let numbersReplacing = "[^0-9]"
        var textReplacing = "[^А-Яа-я]"
        
        switch formatLanguage {
        case .rus:
            textReplacing = "[^А-Яа-я]"
        case .eng:
            textReplacing = "[^A-Za-z]"
        }
        
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
    
    /// - Parameters:
    ///   - mask: mask pls check symbols properly
    ///   - symbol: symbols in mask and symbols here must be equal
    ///   - onlyNumbers: shows can user add text from .numpad or from chosen keyboard
    /// - Returns: formatted string
    func formatText(with mask: String, symbol: String.Element, onlyNumbers: Bool) -> String {
        var result = ""
        var value = self
        let numbersReplacing = "[^0-9]"
        let textReplacing = "[^A-Za-zА-яа-я0-9]"

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
    
    /// That function transform String to Date
    /// - Parameter dateFormat: select case from provided values by enum
    /// - Returns: Returns Date from String
    func stringToDate(dateFormat: DateFormats = .yearMonthDayWithDots) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self)
    }
}
