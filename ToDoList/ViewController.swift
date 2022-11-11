//
//  ViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 11.11.2022.
//

import UIKit


//сверху над филдами подпись .... login
//регистрации, авторизации, картинка на бк. ... закруглить, тень ...

//авторизация - попадаешь на регистрацию - авторизация

class ViewController: UIViewController {
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Enter your login"
        textField.backgroundColor = .yellow
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewsToView()
        setSubviewsLayouts()
        // Do any additional setup after loading the view.
    }
    
    private func addSubviewsToView() {
        view.addSubview(signUpButton)
        view.addSubview(loginTextField)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            signUpButton.widthAnchor.constraint(equalToConstant: 100),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
    }
    
}
