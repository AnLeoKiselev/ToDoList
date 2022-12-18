//
//  TaskEditorViewController.swift
//  ToDoList
//
//  Created by Anatoliy on 20.11.2022.
//

import UIKit
import SwiftUI

class TaskEditorViewController: UIViewController {
    
    var delegate: ReloadTaskListTableVCDelegate? //опционал делегата
    
    var taskNameTaskEditorVC = "" //из VC 1 данные будут передавться сюда
    var descNameTaskEditorVC = ""
    var indexRowTaskEditorVC = 0
    
    private lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    //заголовок
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //заголовок
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
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = UIFont(name: "Avenir Next", size: 20)
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = #colorLiteral(red: 0.459498167, green: 0.385009408, blue: 0.6544987559, alpha: 1)
        textField.layer.borderWidth = 1
        textField.textAlignment = .left
        textField.addPadding(.both(20))
        
        return textField
    }()
    
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
        textView.leftSpace()
        return textView
    }()
    
    private lazy var saveTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.addTarget(self, action: #selector(saveTaskButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Task"
        addToSubview()
        configureItems()
        setSubviewsLayouts()
        
        mainNameTextField.text = taskNameTaskEditorVC
        descriptionTextField.text = descNameTaskEditorVC
        print (indexRowTaskEditorVC)
        //descriptionTextField.text = indexRowTaskEditorVC
    }
    
    private func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Mark as Done", style: .done, target: self, action: #selector(markAsDoneButtonTapped))
    }
    
    private func addToSubview() {
        view.addSubview(backGroundImageView)
        view.addSubview(mainLabel)
        view.addSubview(mainNameTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(saveTaskButton)
    }
    
    @objc func saveTaskButtonTapped() {
        
        LocalStore.shared.taskArray[indexRowTaskEditorVC].mainname = mainNameTextField.text!
        
        LocalStore.shared.taskArray[indexRowTaskEditorVC].descriptionName = descriptionTextField.text!
        
        delegate?.reloadTaskListTableViewVC()
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func markAsDoneButtonTapped() {
        
        LocalStore.shared.taskArray[indexRowTaskEditorVC].status = false
        
        delegate?.reloadTaskListTableViewVC()
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        navigationController?.popViewController(animated: true)
        
        navigationController?.popViewController(animated: true)
    }
    
    private func setSubviewsLayouts() {
        NSLayoutConstraint.activate([
            
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 15),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
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
            
            descriptionTextField.heightAnchor.constraint(equalToConstant: 200),
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            saveTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            saveTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            saveTaskButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20)
        ])
    }
}


//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        TaskEditorViewController().showPreview()
//    }
//}

//отступ для Label
class PaddingLabel: UILabel {

    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat

    required init(withInsets top: CGFloat, _ bottom: CGFloat,_ left: CGFloat,_ right: CGFloat) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}

extension UITextField {

    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }

    func addPadding(_ padding: PaddingSide) {

        self.leftViewMode = .always
        self.layer.masksToBounds = true


        switch padding {

        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always

        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always

        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    // 1.  To add left padding
    //yourTextFieldName.addPadding(.left(20))

    // 2.  To add right padding
    //yourTextFieldName.addPadding(.right(20))

    // 3. To add left & right padding both
    //yourTextFieldName.addPadding(.both(20))
    
}




