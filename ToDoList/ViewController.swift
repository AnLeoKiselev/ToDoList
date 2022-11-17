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
    
    
    
    let backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        //imageView.alpha = 0.3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var emailView = EmailView()
    private lazy var passwordView = PasswordView()
    
//
    
//    let envelopeImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "envelope")
//        //imageView.alpha = 2
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    } ()
    
//    private lazy var signUpButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Sign up", for: .normal)
//        button.backgroundColor = .blue
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 10
//        button.clipsToBounds = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
    //private lazy var loginTextField: UITextField = {
      //  let textField = UITextField()
        //textField.backgroundColor = #colorLiteral(red: 0.3417237401, green: 0.2614808679, blue: 0.5565521121, alpha: 0.6)
        //textField.layer.borderWidth = 1
        //textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //textField.layer.opacity = 0.6
        //textField.layer.cornerRadius = 8
        //textField.placeholder = "            Login"
        //textField.textColor = .black
        //textField.tintColor = .black
        
        //textField.clipsToBounds = true
    
//    let loginTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "             Login"
//        textField.textColor = .white
//        textField.layer.cornerRadius = 8
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        textField.layer.opacity = 1
//        textField.font = UIFont(name: "SF Pro Text", size: 30)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
        
//        textField.leftViewMode = UITextField.ViewModeUITextField.ViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        let image = UIImage(named: "envelope")
//        imageView.image = image
//        textField.leftView = imageView
        
       // textField.translatesAutoresizingMaskIntoConstraints = false
       // return textField
   // }()
    
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
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([

            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            emailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            emailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailView.heightAnchor.constraint(equalToConstant: 48),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 12),
            passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordView.heightAnchor.constraint(equalToConstant: 48)
            
    ])

    }
    
}
