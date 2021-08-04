//
//  Protocols.swift
//  
//
//  Created by Anton Vlezko on 02.08.2021.
//

import Foundation

// MARK: - Protocol

/// Этот протокол обеспечивает функциональность isNil в Binding значениях
public protocol AnyOptional {
    var isNil: Bool { get }
}


/// Этот протокол позволяет задать пользователю ограничения на содержимое строки, а также через метод calculateTextReplacing получить строку содержимое которой не будет удаляться из текстфилда при форматировании
public protocol StringInputTypeProtocol {
    var formatLanguage: FormatWithLanguage { get set }
    var containsText: Bool { get set }
    var containsNumbers: Bool { get set }
    var containsSpecialSymbols: Bool { get set }
}

// MARK: - StringInputTypeProtocol TextReplacing Extension
extension StringInputTypeProtocol {
    
    /// Данная функция возвращает строку передав которую в replacingOccurrences в методах formatText и formatTextAndNumbers можно отформатировать текст
    /// - Returns: Строку необходимую для замены текст неподходящего под форматирование на ""
    func calculateTextReplacing() -> String {
        var text = ""
        let textReplacing = formatLanguage.textReplacing
        let numbersReplacing = "[^0-9]"
        let specialSymbols = " !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~].{8,}$"
        
        if containsText == true {
            text += textReplacing
        }
        
        if containsNumbers == true {
            text += numbersReplacing
        }
        
        if containsSpecialSymbols == true {
            text += specialSymbols
        }
        
        return text
    }
}


