//
//  AddNewTaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 20.11.2022.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    private lazy var mainTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.frame = CGRect(x: 50, y: 150, width: 250, height: 50)
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.tintColor = .blue
        button.underlineText() //подчеркивание кнопки
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 18)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 210, width: 250, height: 50)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Task"
        view.backgroundColor = .green
        view.addSubview(mainTextField)
        view.addSubview(logInButton)
    }
    
    @objc func logInButtonTapped() {
        let newTask = Task(mainname: mainTextField.text!, descriptionName: "qwerty")
        LocalStore.shared.taskArray.append(newTask)
        navigationController?.popViewController(animated: true)
    }
}
