//
//  CreateAccountViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 17.11.2022.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
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
    
    private lazy var emailSmallLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.textColor = .white
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordSmallLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var alreadyhaveAnAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.tintColor = .blue
        button.underlineText() //подчеркивание кнопки
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 18)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        //imageView.alpha = 0.3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var mainLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bird")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create account"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create account", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubviews()
        addSubviewsToView()
        setSubviewsLayouts()
        self.hideKeyboardWhenTappedAround() //клава убирается после тапа везде, в LoginViewController есть extention
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
        view.addSubview(createAccountButton)
        view.addSubview(createAccountLabel)
        view.addSubview(mainLogoImageView)
        view.addSubview(mainLabel)
        view.addSubview(emailSmallLabel)
        view.addSubview(passwordSmallLabel)
        view.addSubview(alreadyhaveAnAccountLabel)
        view.addSubview(logInButton)
    }
    
    @objc func logInButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            emailView.topAnchor.constraint(equalTo: emailSmallLabel.bottomAnchor, constant: 1),
            emailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailView.heightAnchor.constraint(equalToConstant: 48),
            
            passwordView.topAnchor.constraint(equalTo: passwordSmallLabel.bottomAnchor, constant: 1),
            passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordView.heightAnchor.constraint(equalToConstant: 48),
            
            createAccountButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            createAccountButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            createAccountButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16 ),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240),
            createAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            mainLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: mainLogoImageView.bottomAnchor, constant: 7),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailSmallLabel.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 10),
            emailSmallLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailSmallLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailSmallLabel.heightAnchor.constraint(equalToConstant: 25),
            
            passwordSmallLabel.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 5),
            passwordSmallLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordSmallLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordSmallLabel.heightAnchor.constraint(equalToConstant: 25),
            
            alreadyhaveAnAccountLabel.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 15),
            alreadyhaveAnAccountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 77),
            
            logInButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 9),
            logInButton.leadingAnchor.constraint(equalTo: alreadyhaveAnAccountLabel.trailingAnchor, constant: 5)
        ])
    }
}


