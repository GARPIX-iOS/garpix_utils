//
//  NetworkChecker.swift
//  Red
//
//  Created by Danil Lomaev on 22.03.2021.
//

#if canImport(UIKit)
import Foundation
import Network
import Combine

/// Обсервер, который реактивно следит за состоянием сети на устройстве
/// Лучше использовать со SwiftUI в виде Env. Object
///
/// Инициализация
/// ```
/// import SwiftUI
/// import GXUtilz
///
/// @main
/// struct testSPMApp: App {
///     let networkChecker = NetworkChecker()
///     var body: some Scene {
///         WindowGroup {
///             ContentView()
///                 .environmentObject(networkChecker)
///         }
///     }
/// }
/// ```
/// Вставляем в нужную View
/// ```
/// @EnvironmentObject var networkChecker: NetworkChecker
/// ```
/// Дальше можно обращаться к networkChecker и получать реактивно все данные о сети
///
@available(iOS 14.0, *)
public class NetworkChecker: ObservableObject {
    @Published public var status: NWPath.Status = .satisfied
    
    /// Издатель NWPathMonitor сразу публикает изменения сети
    public init() {
        NWPathMonitor()
            .publisher()
            .map { $0.status }
            .assign(to: &$status)
    }
}
#endif
