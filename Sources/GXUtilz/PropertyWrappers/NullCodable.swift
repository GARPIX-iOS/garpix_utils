//
//  File.swift
//  
//
//  Created by Danil Lomaev on 11.07.2021.
//

import Foundation

/// Заставляет Encodable and Decodable свойства превращаться в `null` вместо того, чтобы убирать значения из объекта при сериализации.
/// ```
/// struct User: Codable {
///     var name: String = ""
///     @NullCodable var favMusicAlbum: String?
/// }
/// // При декодировании структуры или в использовании Alamofire
/// // Получается такой json
/// // Output json:
/// // { "name": "",  favMusicAlbum: null }
/// ```
@propertyWrapper
public struct NullCodable<T> {
    /// Значение, которое может оказаться null(nil)
    public var wrappedValue: T?
    
    ///  Init
    /// - Parameter wrappedValue: Значение, которое может оказаться null(nil)
    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}

extension NullCodable: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case let .some(value):
            try container.encode(value)
        case .none:
            try container.encodeNil()
        }
    }
}

extension NullCodable: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try? container.decode(T.self)
    }
}
