//
//  EmailView.swift
//  ToDoList
//
//  Created by Anatoliy on 16.11.2022.
//

import UIKit

class EmailView: UIView, UITextFieldDelegate {
    
    let envelopeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "envelope")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.text = "E-mail"
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
        addSubview(envelopeImageView)
        addSubview(loginTextField)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            envelopeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            envelopeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            loginTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

