//
//  ViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 11.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
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
    
    private lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "No account?"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create one", for: .normal)
        button.tintColor = .blue
        button.underlineText()
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 18)
        button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
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
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
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
        
    }
    
    @IBAction func createAccountButtonTapped() {
        present(CreateAccountViewController(), animated: true)
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
        view.addSubview(mainLogoImageView)
        view.addSubview(mainLabel)
        view.addSubview(emailSmallLabel)
        view.addSubview(passwordSmallLabel)
        view.addSubview(noAccountLabel)
        view.addSubview(createAccountButton)
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
            
            loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16 ),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            mainLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: mainLogoImageView.bottomAnchor, constant: 7),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailSmallLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            emailSmallLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailSmallLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailSmallLabel.heightAnchor.constraint(equalToConstant: 25),
            
            passwordSmallLabel.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 5),
            passwordSmallLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordSmallLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordSmallLabel.heightAnchor.constraint(equalToConstant: 25),
            
            noAccountLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            noAccountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90),
            
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 9),
            createAccountButton.leadingAnchor.constraint(equalTo: noAccountLabel.trailingAnchor, constant: 5)
        ])
    }
}

extension UIButton {
  func underlineText() {
    guard let title = title(for: .normal) else { return }

    let titleString = NSMutableAttributedString(string: title)
    titleString.addAttribute(
      .underlineStyle,
      value: NSUnderlineStyle.single.rawValue,
      range: NSRange(location: 0, length: title.count)
    )
    setAttributedTitle(titleString, for: .normal)
  }
}




