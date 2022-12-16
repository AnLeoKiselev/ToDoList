//
//  CustomTableViewCell.swift
//  ToDoList
//
//  Created by Anatoliy on 28.11.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    var delegate: ReloadTaskListTableVCDelegate? //опционал делегата

    private lazy var checkBoxButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var trashBoxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "trash"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(trashBoxButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20,weight:.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 17,weight:.light)
        textView.textAlignment = .left
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContentView()
    }
    
    private func configureContentView() {
        contentView.backgroundColor = #colorLiteral(red: 0.3535276055, green: 0.2688581944, blue: 0.5764445066, alpha: 1)
        contentView.addSubview(trashBoxButton)
        contentView.addSubview(checkBoxButton)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(mainLabelText: String, descriptionLabelText: String, imageName: String, tag: Int) {
        mainLabel.text = mainLabelText
        descriptionLabel.text = descriptionLabelText
        checkBoxButton.tag = tag
        checkBoxButton.setBackgroundImage(UIImage(named: imageName), for: UIControl.State.normal)
    }
    
    override func prepareForReuse() {
        mainLabel.text = nil
        descriptionLabel.text = nil
        //trashBoxButton.setBackgroundImage = nil
        //checkBoxButton.setBackgroundImage = ""
    }
    
    @objc private func checkBoxButtonTapped(_ sender: UIButton) {
        LocalStore.shared.taskArray[sender.tag].status.toggle()
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    
        delegate?.reloadTaskListTableViewVC()
        
    
        print ("должно1")
    }
    
    @objc private func trashBoxButtonTapped(_ sender: UIButton) {
        LocalStore.shared.taskArray.remove(at: sender.tag)
        
        //vibration
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        
        delegate?.reloadTaskListTableViewVC()
        
        print ("должно2")
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            
            checkBoxButton.heightAnchor.constraint(equalToConstant: 40),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 40),
            checkBoxButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            checkBoxButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 20),
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 75),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            
            trashBoxButton.heightAnchor.constraint(equalToConstant: 30),
            trashBoxButton.widthAnchor.constraint(equalToConstant: 25),
            trashBoxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trashBoxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
         
        ])
    }
}
    
    
    
