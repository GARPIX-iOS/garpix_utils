//
//  File.swift
//  
//
//  Created by Danil Lomaev on 06.06.2021.
//
#if canImport(UIKIt)
import Foundation
import UIKit


/// Структура - обертка для получения высоты и ширины телефона
/// ```
/// Text("Hello").frame(width: Display.width, height: Display.height * 0.9)
/// ```
public struct Display {
    /// Ширина телефона
    public static var width = UIScreen.main.bounds.width
    ///  Высота телефона
    public static var height = UIScreen.main.bounds.height
}


public extension CGFloat {
    
    /// Функция для взятия фрейма от ширины экрана в процентах
    /// - Parameter percent: Процент от ширины
    /// - Returns: Ширина фрейма
    static func displayWidth(_ percent: Double) -> CGFloat {
        Display.width * CGFloat(percent) / 100
    }
    
    /// Функция для взятия фрейма от высоты экрана в процентах
    /// - Parameter percent: Процент от высоты
    /// - Returns: Высота фрейма
    static func displayHeight(_ percent: Double) -> CGFloat {
        Display.height * CGFloat(percent) / 100
    }
}

#endif
