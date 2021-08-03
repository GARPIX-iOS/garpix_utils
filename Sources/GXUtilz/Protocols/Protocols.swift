//
//  Protocols.swift
//  
//
//  Created by Anton Vlezko on 02.08.2021.
//

import Foundation

// MARK: - Protocol

/// Этот протокол обеспечивает функциональность isNil в Binding значениях
public protocol AnyOptional {
    var isNil: Bool { get }
}
