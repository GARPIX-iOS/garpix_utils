//
//  StringInputType.swift
//  
//
//  Created by Anton Vlezko on 05.08.2021.
//

import Foundation

/// Этот протокол позволяет задать пользователю ограничения на содержимое строки, а также через метод calculateTextReplacing получить строку содержимое которой не будет удаляться из текстфилда при форматировании
public protocol StringInputTypeProtocol {
    /// Необходима для выбора языка текста который будет использован для  ограничения ввода пользователем
    var formatLanguage: FormatWithLanguage? { get set }
    /// Установите true если хотите позволить пользователю вводить текст
    var containsText: Bool { get set }
    /// Установите true если хотите позволить пользователю вводить числа
    var containsNumbers: Bool { get set }
    /// Установите true если хотите позволить пользователю вводить специальные символы
    var containsSpecialSymbols: Bool { get set }
}

// MARK: - StringInputTypeProtocol TextReplacing Extension
extension StringInputTypeProtocol {
    
    /// Данная функция возвращает строку передав которую в replacingOccurrences в методах formatText и formatTextAndNumbers можно отформатировать текст
    /// ```
    /// let inputType = StringInputType(
    ///     containsText: false,
    ///     containsNumbers: true,
    ///     containsSpecialSymbols: false
    /// )
    ///
    /// let textReplacing: String = inputType?.calculateTextReplacing() ?? "" // output -> "[^0-9]"
    /// ```
    /// - Returns: Строку необходимую для замены текст неподходящего под форматирование на ""
    func calculateTextReplacing() -> String {
        var text = ""
        let textReplacing = formatLanguage?.textReplacing ?? FormatWithLanguage.eng.textReplacing
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

/// Структура подписанная под протокол StringInputTypeProtocol упрощающая взаимодействие клиента с функциями форматирования текста
public struct StringInputType: StringInputTypeProtocol {
    /// Необходима для выбора языка текста который будет использован для  ограничения ввода пользователем
    public var formatLanguage: FormatWithLanguage?
    /// Установите true если хотите позволить пользователю вводить текст
    public var containsText: Bool
    /// Установите true если хотите позволить пользователю вводить числа
    public var containsNumbers: Bool
    /// Установите true если хотите позволить пользователю вводить специальные символы
    public var containsSpecialSymbols: Bool
    
    /// Если не выбрать параметр форматирования языка то в таком случае вы получите init с английским языком
    public init(
        formatLanguage: FormatWithLanguage? = nil,
        containsText: Bool,
        containsNumbers: Bool,
        containsSpecialSymbols: Bool
    ) {
        self.formatLanguage = formatLanguage
        self.containsText = containsText
        self.containsNumbers = containsNumbers
        self.containsSpecialSymbols = containsSpecialSymbols
    }
}
