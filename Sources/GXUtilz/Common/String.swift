//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import UIKit

public extension String {
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
