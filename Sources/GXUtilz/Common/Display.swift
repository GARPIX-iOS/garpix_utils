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
#endif
