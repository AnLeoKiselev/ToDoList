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
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
        NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(_colorLiteralRed: 0.6904429793, green: 0.6597178578, blue: 0.8047469258, alpha: 0.5)])
        textField.enablesReturnKeyAutomatically = true
        //textField.textColor = #colorLiteral(red: 0.6904429793, green: 0.6597178578, blue: 0.8047469258, alpha: 1)
        textField.textColor = .white
        textField.font = UIFont(name: "SF Pro Text Bold", size: 20)
        textField.keyboardType = .emailAddress //тип клавиатуры
        //textField.keyboardAppearance = .dark
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
        addSubview(emailTextField)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            envelopeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            envelopeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

