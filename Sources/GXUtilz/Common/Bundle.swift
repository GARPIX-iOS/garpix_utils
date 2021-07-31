//
//  File.swift
//  
//
//  Created by Anton on 20.07.2021.
//

import UIKit

public extension Bundle {
    /// Получаем файл с устройства
    /// - Parameters:
    ///   - : Тип, ограниченный протоколом Decodable
    ///   - file: Имя файла, из которого будем извлекать дату
    /// - Returns: Тип, ограниченный протоколом Decodable
    func decode<T: Decodable>(_: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }

        let decoder = JSONDecoder()

        do {
            return try decoder.decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            fatalError("\(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            fatalError("Key '\(key)' not found: \(context.debugDescription), ")
        } catch let DecodingError.valueNotFound(value, context) {
            fatalError("Value '\(value)' not found:\(context.debugDescription)")
        } catch let DecodingError.typeMismatch(type, context) {
            fatalError("Type '\(type)' mismatch: \(context.debugDescription)")
        } catch {
            fatalError("error: \(error)")
        }
    }
}
