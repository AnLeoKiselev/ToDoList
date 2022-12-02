//
//  AddNewTaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 20.11.2022.
//

import UIKit
import SwiftUI //https://www.youtube.com/watch?v=KZTtktlBOeM

class AddNewTaskViewController: UIViewController {
    
    private lazy var newTaskTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Task"
        view.backgroundColor = #colorLiteral(red: 0.2274511456, green: 0.2183080614, blue: 0.2804787457, alpha: 1)
        view.addSubview(newTaskTextField)
        view.addSubview(addTaskButton)
        setSubviewsLayouts()
    }
    
    @objc func logInButtonTapped() {
        let newTask = Task(mainname: newTaskTextField.text!, descriptionName: newTaskTextField.text!)
        LocalStore.shared.taskArray.append(newTask)
        navigationController?.popViewController(animated: true)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            
            newTaskTextField.heightAnchor.constraint(equalToConstant: 300),
            newTaskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            newTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            newTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            addTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTaskButton.topAnchor.constraint(equalTo: newTaskTextField.bottomAnchor, constant: 20)
        ])
        
    }
    
    struct ViewControllerProvider: PreviewProvider {
        static var previews: some View {
            AddNewTaskViewController().showPreview()
        }
    }
}
