//
//  File.swift
//  
//
//  Created by Danil Lomaev on 06.06.2021.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
public extension View {
    /// Удобная обертка, которую можно использовать во всех SwiftUI View для скрытия клавиатуры программно
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
#endif
