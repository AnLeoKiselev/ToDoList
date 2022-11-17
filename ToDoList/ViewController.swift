//
//  ViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 11.11.2022.
//

import UIKit

//сверху над филдами подпись .... login
//регистрации, авторизации, картинка на бк. ... закруглить, тень ...

//путь: авторизация - попадаешь на регистрацию - авторизация

class ViewController: UIViewController {
    
    private lazy var emailView = EmailView()
    private lazy var passwordView = PasswordView()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Todo List"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        //imageView.alpha = 0.3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bird")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubviews()
        addSubviewsToView()
        setSubviewsLayouts()
        
    }
    
    private func setSubviews() {
        emailView.layer.cornerRadius = 8
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        emailView.backgroundColor = #colorLiteral(red: 0.3417237401, green: 0.2614808679, blue: 0.5565521121, alpha: 0.9)
        
        passwordView.layer.cornerRadius = 8
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        passwordView.backgroundColor = #colorLiteral(red: 0.3417237401, green: 0.2614808679, blue: 0.5565521121, alpha: 0.9)
    }
    
    private func addSubviewsToView() {
        view.addSubview(backGroundImageView)
        view.addSubview(emailView)
        view.addSubview(passwordView)
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
        view.addSubview(mainImageView)
        view.addSubview(mainLabel)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            emailView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 18),
            emailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailView.heightAnchor.constraint(equalToConstant: 48),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 12),
            passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordView.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16 ),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 7),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
