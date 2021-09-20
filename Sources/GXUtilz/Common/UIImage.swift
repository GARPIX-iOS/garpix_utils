//
//  UIImage.swift
//  
//
//  Created by yns on 20.09.2021.
//

import SwiftUI

public extension UIImage {
    
    func aspectFittedToHeight(_ newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}

public extension View {
    
    /**
     Сжатие изображения UIImage путем преобразования его в JPEG, уменьшая его размер и качество
     
     Создать UIImage
     ```
     @State private var image = UIImage()
     ```
     Или
     ```
     let image = UIImage()
     ```
     Пример использование
    ```
     .onChange(of: image, perform: { image in
         compressedImage = compressImage(image: image)
     })
     */
    
    func compressImage(image: UIImage) -> UIImage {
        let resizedImage = image.aspectFittedToHeight(200)
        resizedImage.jpegData(compressionQuality: 0.2)
        
        return resizedImage
    }
}
