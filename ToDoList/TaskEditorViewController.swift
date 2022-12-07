//
//  TaskEditorViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 20.11.2022.
//

import UIKit
import SwiftUI

class TaskEditorViewController: UIViewController {
  
  
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.2274511456, green: 0.2183080614, blue: 0.2804787457, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.font = UIFont(name: "Avenir Next", size: 20)
        textField.layer.cornerRadius = 10
        textField.textAlignment = .left
        
        return textField
    }()
    
    private lazy var descriptionTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.2274511456, green: 0.2183080614, blue: 0.2804787457, alpha: 1)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .white
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.layer.cornerRadius = 10
        textView.textAlignment = .left
        
        return textView
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.addTarget(self, action: #selector(editTaskButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Task"
        view.backgroundColor = #colorLiteral(red: 0.1097827628, green: 0.1051032469, blue: 0.1424088478, alpha: 1)
        view.addSubview(mainLabel)
        view.addSubview(mainNameTextField)
        view.addSubview (descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(addTaskButton)
        setSubviewsLayouts()
        
    }
    
    @objc func editTaskButtonTapped() {
        //let newTask = Task(mainname: mainNameTextField.text!, descriptionName: descriptionTextField.text!,status: false)
        //LocalStore.shared.taskArray.append(newTask)
        //TaskListViewController().reloadData()
        
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            
            
            mainLabel.heightAnchor.constraint(equalToConstant: 15),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            mainNameTextField.heightAnchor.constraint(equalToConstant: 50),
            mainNameTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
            mainNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 15),
            descriptionLabel.topAnchor.constraint(equalTo: mainNameTextField.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            descriptionTextField.heightAnchor.constraint(equalToConstant: 200),
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            
            addTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTaskButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20)
        ])
        
    }
    
}
    
//    struct ViewControllerProvider: PreviewProvider {
//        static var previews: some View {
//            TaskEditorViewController().showPreview()
//        }
//    }

    
    

    
    

