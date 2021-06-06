//
//  File.swift
//  
//
//  Created by Danil Lomaev on 06.06.2021.
//

import Foundation

public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunkedArray = [[Element]]()

        for index in 0 ... count {
            if index % size == 0, index > 0 {
                chunkedArray.append(Array(self[(index - size) ..< index]))
            } else if index == count {
                chunkedArray.append(Array(self[index - 1 ..< index]))
            }
        }

        return chunkedArray
    }
}

public extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
