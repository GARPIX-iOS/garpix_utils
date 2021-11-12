//
//  File.swift
//  
//
//  Created by Danil on 12.11.2021.
//

import Foundation
import SwiftUI

struct OpacityIf: ViewModifier {
    @Binding var condition: Bool
    @Binding var value: Double


    func body(content: Content) -> some View {
        content
            .opacity(condition ? value : 1.0)
    }
}

extension View {
    /// Если условие правдивое, то на View будет действовать opacity с определенным значением
    /// - Parameters:
    ///   - condition: условие
    ///   - value: значение прозрачности
    /// - Returns: новая View
    func opacityIf(condition: Binding<Bool>, value: Binding<Double>) -> some View {
        modifier(OpacityIf(condition: condition, value: value))
    }
}

struct OpacityIfNot: ViewModifier {
    @Binding var condition: Bool
    @Binding var value: Double


    func body(content: Content) -> some View {
        content
            .opacity(condition ? 1.0 : value)
    }
}

extension View {
    /// Если условие ложное, то на View будет действовать opacity с определенным значением
    /// - Parameters:
    ///   - condition: условие
    ///   - value: значение прозрачности
    /// - Returns: новая View
    func opacityIfNot(condition: Binding<Bool>, value: Binding<Double>) -> some View {
        modifier(OpacityIfNot(condition: condition, value: value))
    }
}
