//
//  BidirectionalCollection.swift
//  
//
//  Created by yns on 20.09.2021.
//

import Foundation

public extension BidirectionalCollection where Element: StringProtocol {
    /// Превращает массив в сериализованную строку
    ///
    /// Допустим, у нас есть множество иномарок
    /// ```
    /// var autoMarks = ["Toyota", "Hyundai", "Kia", "BMW"]
    /// ```
    /// И хотим превратить его в сериализованную строку, например таким образом:
    ///```
    ///Toyota, Hyundai, Kia и BMW
    ///```
    
    var arraySerialized: String {
        count <= 2 ?
            joined(separator: " и ") :
            dropLast().joined(separator: ", ") + " и " + last!
    }
}

