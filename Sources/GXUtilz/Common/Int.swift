//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import Foundation

public extension Int {
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
        if result == 0 || result > 4 {
            return declensions[2]
        } else if result > 1 {
            return declensions[1]
        } else if result == 1 {
            return declensions[0]
        }
        return ""
    }
}
