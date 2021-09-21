//
//  File.swift
//  
//
//  Created by Danil Lomaev on 06.06.2021.
//

import Foundation
import SwiftUI
import UIKit

/// Структура, которая описывает скругленные углы
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension View {
    /// Функция для задания cornerRadius различным углам
    /// ```
    /// import SwiftUI
    /// VStack { ... }.cornerRadius(12, corners: [.topLeft, .bottomRight])
    /// ```
    /// - Parameters:
    ///   - radius: Радиус скругления
    ///   - corners: Массив углов (например, [.topLeft, .bottomLeft])
    /// - Returns: View со скругленными углами
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
