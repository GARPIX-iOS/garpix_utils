//
//  Protocols.swift
//  
//
//  Created by Anton Vlezko on 02.08.2021.
//

import Foundation

// MARK: - Protocol

/// That protocol provides isNil functionality to Binding values
public protocol AnyOptional {
    var isNil: Bool { get }
}
