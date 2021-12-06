//
//  File.swift
//  
//
//  Created by Danil on 06.12.2021.
//

import Foundation
import Combine

@propertyWrapper
public class PasswordPublished {
    /// Строковое значение email
    @Published var value: String
    private var passValidator = PasswordValidation()
    
    ///  Значение, которое служит для постоянного обновления значения
    public var wrappedValue: String {
        get { value }
        set { value = newValue }
    }
    
    /// Значение, которое можно использовать, как издателя и подписываться на него
    public var projectedValue: AnyPublisher<Bool, Never> {
        return $value
            .map {  [weak self] pass in
                guard let self = self else { return false }
                return self.passValidator.validatePassword(with: pass)
            }
            .eraseToAnyPublisher()
    }
    
    /// Инициализация
    /// - Parameter initialValue: обычное начальное значение, как для обычной переменной
    public init(wrappedValue initialValue: String) {
        value = initialValue
    }
}
