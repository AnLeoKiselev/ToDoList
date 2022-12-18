//
//  AddNewTaskViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 20.11.2022.
//

import UIKit
import SwiftUI //https://www.youtube.com/watch?v=KZTtktlBOeM

class AddNewTaskViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    var delegate: ReloadTaskListTableVCDelegate? //опционал делегата

    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    private lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    //название поля
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.textColor = #colorLiteral(red: 0.3535276055, green: 0.2688581944, blue: 0.5764445066, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //название поля
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = #colorLiteral(red: 0.3535276055, green: 0.2688581944, blue: 0.5764445066, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //поле ввода
    
    
    private lazy var mainNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = UIFont(name: "Avenir Next", size: 20)
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = #colorLiteral(red: 0.459498167, green: 0.385009408, blue: 0.6544987559, alpha: 1)
        textField.layer.borderWidth = 1
        textField.textAlignment = .left
        
        return textField
    }()

    //поле ввода
    private lazy var descriptionTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = #colorLiteral(red: 0.459498167, green: 0.385009408, blue: 0.6544987559, alpha: 1)
        textView.layer.borderWidth = 1
        textView.textAlignment = .left
        return textView
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.addTarget(self, action: #selector(addNewTaskButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Task"
        //view.backgroundColor = #colorLiteral(red: 0.7195851214, green: 0.6823450527, blue: 0.9765150138, alpha: 1)
        view.addSubview(backGroundImageView)
        view.addSubview(mainLabel)
        view.addSubview(mainNameTextField)
        view.addSubview (descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(addTaskButton)
        setSubviewsLayouts()
        
        sheetPresentationController.delegate = self

        sheetPresentationController.preferredCornerRadius = 20
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.medium()]

   }
    
    @objc func addNewTaskButtonTapped() {
        let newTask = Task(mainname: mainNameTextField.text!, descriptionName: descriptionTextField.text!, status: false)
        LocalStore.shared.taskArray.append(newTask)
        
        delegate?.reloadTaskListTableViewVC()
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 15),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            mainNameTextField.heightAnchor.constraint(equalToConstant: 50),
            mainNameTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            mainNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 15),
            descriptionLabel.topAnchor.constraint(equalTo: mainNameTextField.bottomAnchor, constant: 25),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            descriptionTextField.heightAnchor.constraint(equalToConstant: 250),
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
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
//            AddNewTaskViewController().showPreview()
//        }
//    }
//}


