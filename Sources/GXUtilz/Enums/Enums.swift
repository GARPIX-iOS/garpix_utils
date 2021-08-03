//
//  Enums.swift
//  
//
//  Created by Anton Vlezko on 02.08.2021.
//

import Foundation

// MARK: - Enum

/// Это перечисление необходимо в функцях форматирующих текст для определения того на что заменять текст
public enum FormatWithLanguage {
    case rus
    case eng
    
    var textReplacing: String {
        switch self {
        case .rus:
            return "[^А-Яа-я]"
        case .eng:
            return "[^A-Za-z]"
        }
    }
}

/// Это перечисление необходимо для упрощения форматирования в предоставленных нами методах  stringToDate или dateToString
public enum DateFormats: String {
    case yearMonthDayWithDots = "yyyy.MM.dd"
    case yearMonthDayWithLine = "yyyy-MM-dd"
    case dayMonthLetterYear = "dd MMM yyyy"
    case dayMonthDigitsYear = "dd.MM.yyyy"
    case serverTime = "yyyy-MM-dd'T'HH:mm:ss+hh:mm"
    case dayMonthLetterYearAndTime = "dd MMM yyyy 'в' HH:mm"
    case timeWithDigits = "HH:mm"
    case yearMonthDayWithLineAndTime = "yyyy-MM-dd HH:mm:ss"
}
