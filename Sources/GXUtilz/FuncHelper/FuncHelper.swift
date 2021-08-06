//
//  File.swift
//  
//
//  Created by Anton on 03.08.2021.
//

import Foundation

/// Структура с функциями-помощниками
public struct FuncHelper {
    /// Функция для получения существительного в нужном склонении при использовании с числительными
    /// например: 1 яблоко, 3 яблока, 5 яблок
    /// ```
    /// let apple = FuncHelper.getWordFrom(declensions: ["яблоко", "яблока", "яблок"], int: 3)
    /// // output -> "яблока"
    /// ```
    /// - Parameters:
    ///   - declensions: здесь нужно указать слово в 3 склонениях (например: ["стул", "стула", "стульев"])
    ///   - int: числительное, вместе с которым будет склоняться существительное
    /// - Returns: существительное в нужном склонении
    public static func getWordFrom(declensions: [String], int: Int) -> String {
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
