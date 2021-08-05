//
//  File.swift
//  
//
//  Created by Danil Lomaev on 06.06.2021.
//

import Foundation

public extension Array {
    /// Разбивает массив на 2 части
    /// ```
    /// let array = [1,2,3,4,5,6]
    /// array.split() // output -> ([1,2,3], [4,5,6])
    /// ```
    /// - Returns: left: - левые элементы, собранные в массив, right: - правые элементы, собранные в массив
    func split() -> (left: [Element], right: [Element]) {
        let ct = count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
