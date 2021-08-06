//
//  File.swift
//  
//
//  Created by Anton on 03.08.2021.
//

import UIKit
import SwiftUI

public extension UIViewController {
    /// Функция добавляет  `View` из SwiftUI в качестве дочерней для `UIView`.
    /// ```
    /// struct ExampleView: View {
    ///    var body: some View {
    ///        Text("Hello world")
    ///    }
    /// }
    ///
    /// let controller = UIViewController()
    /// controller.addSubSwiftUIView(ExampleView(), to: controller.view)
    /// ```
    /// - Parameters:
    ///   - swiftUIView: `View` из SwiftUI, которая добавляется в качестве дочерней вью .
    ///   - view: `UIView` родительская, в которую будет добавлена swiftUIView .
    func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content: View {
        let hostingController = UIHostingController(rootView: swiftUIView)

        /// Добавить в качестве дочернего элемента текущего ViewController.
        addChild(hostingController)

        /// Добавить SwiftUI view в иерархию вью ViewController.
        view.addSubview(hostingController.view)

        /// Настройка выравнивания и расположения добавленной swiftUIView относительно родительского ViewController.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor),
        ]

        NSLayoutConstraint.activate(constraints)

        /// Уведомить  hostingController, что он был перемещен к текущему ViewController.
        hostingController.didMove(toParent: self)
    }
}
