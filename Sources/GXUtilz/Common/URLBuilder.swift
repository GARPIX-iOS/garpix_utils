//
//  File.swift
//  
//
//  Created by Danil Lomaev on 06.06.2021.
//

import Foundation

/// Структура для постройки URL
public struct URLBuilder {
    /// Функция, которая добавляет query параметры к строке
    /// ```
    /// URLBuilder.buildQuery(path: "endpoint", queryParams: ["s":"search"])
    /// ```
    /// - Parameters:
    ///   - path: основной путь URL
    ///   - queryParams: Словарь в виде `название query параметра` :  `значение query параметра`
    /// - Returns: URL с query параметрами в виде обычной строки (можно смело кастить в тип URL)
    public static func buildQuery(path: String, queryParams: [String: String]) -> String {
        var urlComponents = URLComponents()
        urlComponents.path = path
        urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0, value: $1) }
        guard let urlString = urlComponents.url?.absoluteString else { return "" }
        return urlString
    }
}
