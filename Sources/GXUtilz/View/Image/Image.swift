//
//  File.swift
//  
//
//  Created by Danil on 12.11.2021.
//

import Foundation
import SwiftUI

public extension Image {
    /// Ресайз картинки с растягиванием по фрейму
    ///
    ///
    /// Image("sample.jpg").resizeToFill(width: 126, height: 140)
    ///
    /// - Parameters:
    ///   - width: Ширина фрейма
    ///   - height: Высота фрейма
    /// - Returns: Картинка
    func resizeToFill(width: CGFloat?, height: CGFloat?) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: width)
    }
    
    /// Ресайз картинки с подставкой в фрейм
    ///
    /// Image("sample.jpg").resizeToFit(width: 126, height: 140)
    ///
    /// - Parameters:
    ///   - width: Ширина фрейма
    ///   - height: Высота фрейма
    /// - Returns: Картинка
    func resizeToFit(width: CGFloat?, height: CGFloat?) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: width, height: width)
    }
}
