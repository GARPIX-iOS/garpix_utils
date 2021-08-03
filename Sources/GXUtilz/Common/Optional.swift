//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import Foundation

// MARK: - Optional extensions
extension Optional: AnyOptional {
    /// Эта переменная проверяет, равно ли значение нулю
    public var isNil: Bool { self == nil }
}

public extension Optional where Wrapped == Int {
    /// Этот метод преобразует Int? в Double?
    /// - Returns: Double?
    func optIntToOptDouble() -> Double? {
        if let unwrapInt = self {
            return Double(unwrapInt)
        } else {
            return nil
        }
    }
}

public extension Optional where Wrapped == Double {
    /// Этот метод преобразует Double? в Int?
    /// - Returns: Int?
    func optDoubleToOptInt() -> Int? {
        if let unwrapDouble = self {
            return Int(unwrapDouble)
        } else {
            return nil
        }
    }
}
