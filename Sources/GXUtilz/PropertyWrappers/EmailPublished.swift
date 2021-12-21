//
//  File.swift
//  
//
//  Created by Danil on 21.09.2021.
//
import Combine
import Foundation

/// Издатель, который можно использовать для обычного доступа к реактивной строке e-mail
///  или использовать projectedValue для того, чтобы проверить email на валидность
///  
/// ```
/// class UserViewModel: ObservableObject {
///  // Объявляем email
/// @EmailPublished var email = ""
///
///  // Пример фукнции для валидации
/// func validateEmail() {
///   $email
///    .receive(on: RunLoop.main)
///    .sink(receiveValue: { [weak self] isValid in
///                  ...........
///    })
///    .store(in: &cancellableSet)
///  }
/// }
///  // Пример использования просто как строку
/// userViewModel.email
///  // ---> Вернет обычную строку, например "test@mail.ru"
/// ```
@propertyWrapper
public class EmailPublished {
    /// Строковое значение email
    @Published var value: String
    
    ///  Значение, которое служит для постоянного обновления значения
    public var wrappedValue: String {
        get { value }
        set { value = newValue }
    }
    
    /// Значение, которое можно использовать, как издателя и подписываться на него
    public var projectedValue: AnyPublisher<Bool, Never> {
        return $value
            .removeDuplicates()
            .map { email in
                email.isValidEmail
            }
            .eraseToAnyPublisher()
    }
    
    /// Инициализация
    /// - Parameter initialValue: обычное начальное значение, как для обычной переменной
    public init(wrappedValue initialValue: String) {
        value = initialValue
    }
}
