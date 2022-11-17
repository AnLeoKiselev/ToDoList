//
//  PasswordView.swift
//  ToDoList
//
//  Created by Anatoliy on 17.11.2022.
//

import UIKit

class PasswordView: UIView, UITextFieldDelegate {
    
    let lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Password"
        textField.textColor = #colorLiteral(red: 0.6904429793, green: 0.6597178578, blue: 0.8047469258, alpha: 1)
        textField.font = UIFont(name: "SF Pro Text Bold", size: 200)
        textField.keyboardType = .emailAddress //тип клавиатуры
        textField.keyboardAppearance = .dark
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(lockImageView)
        addSubview(passwordTextField)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            lockImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            
            passwordTextField.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}


