//
//  NWPathMonitor + Combine.swift
//  Red
//
//  Created by Danil Lomaev on 22.03.2021.
//

#if canImport(UIKit)
import Combine
import Foundation
import Network

// https://gist.github.com/YusukeHosonuma/0a39266dd5c2232d6d0a42f826adb8e6

public extension NWPathMonitor {
    /// Издатель для NWPathMonitor
    /// - Parameter queue: Очередь, в которой работает паблишер
    /// - Returns: Структура Publisher
    func publisher(queue: DispatchQueue = DispatchQueue.main) -> NWPathMonitor.Publisher {
        Publisher(monitor: self, queue: queue)
    }
    
    /// Класс подписчика для ловли значений NWPathMonitor
    final class Subscription<S: Subscriber>: Combine.Subscription where S.Input == NWPath {
        private let subscriber: S
        private let monitor: NWPathMonitor
        private let queue: DispatchQueue
        private var isStarted = false

        init(subscriber: S, monitor: NWPathMonitor, queue: DispatchQueue) {
            self.subscriber = subscriber
            self.monitor = monitor
            self.queue = queue
        }

        public func request(_ demand: Subscribers.Demand) {
            precondition(demand == .unlimited, "This subscription is only supported to `Demand.unlimited`.")

            guard !isStarted else { return }
            isStarted = true

            monitor.pathUpdateHandler = { [unowned self] path in
                _ = self.subscriber.receive(path)
            }
            monitor.start(queue: queue)
        }

        public func cancel() {
            monitor.cancel()
        }
    }
    
    /// Переопределение Combine.Publisher для реактивного подхода
    struct Publisher: Combine.Publisher {
        // swiftlint:disable nesting
        public typealias Output = NWPath
        // swiftlint:disable nesting
        public typealias Failure = Never

        private let monitor: NWPathMonitor
        private let queue: DispatchQueue

        init(monitor: NWPathMonitor, queue: DispatchQueue) {
            self.monitor = monitor
            self.queue = queue
        }

        public func receive<S>(subscriber: S) where S: Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let subscription = Subscription(subscriber: subscriber, monitor: monitor, queue: queue)
            subscriber.receive(subscription: subscription)
        }
    }
}
#endif
