//
//  File.swift
//  
//
//  Created by Danil on 03.12.2021.
//

import Foundation
import Combine

// TODO: - documentation
@propertyWrapper
public class NamesPublished {
    /// Строковое значение email
    @Published var value: String
    private var namesValidator = NamesValidation()
    
    ///  Значение, которое служит для постоянного обновления значения
    public var wrappedValue: String {
        get { value }
        set { value = newValue }
    }
    
    /// Значение, которое можно использовать, как издателя и подписываться на него
    public var projectedValue: AnyPublisher<Bool, Never> {
        return $value
            .removeDuplicates()
            .map { [weak self] name in
                guard let self = self else { return false }
                return self.namesValidator.validateName(with: name)
            }
            .eraseToAnyPublisher()
    }
    
    /// Инициализация
    /// - Parameter initialValue: обычное начальное значение, как для обычной переменной
    public init(wrappedValue initialValue: String) {
        value = initialValue
    }
}
