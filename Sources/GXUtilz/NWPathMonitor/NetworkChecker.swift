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

@available(iOS 14.0, *)
/// Обсервер, который реактивно следит за состоянием сети на устройстве
/// Лучше использовать со SwiftUI в виде Env. Object
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
