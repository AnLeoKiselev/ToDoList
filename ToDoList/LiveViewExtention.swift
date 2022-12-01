//
//  LiveViewExtention.swift
//  ToDoList
//
//  Created by Anatoliy on 30.11.2022.
//  https://www.youtube.com/watch?v=KZTtktlBOeM

import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}



