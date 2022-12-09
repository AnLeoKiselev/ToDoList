//
//  CustomTableViewCell.swift
//  ToDoList
//
//  Created by Anatoliy on 28.11.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20,weight:.semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17,weight:.light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.3535276055, green: 0.2688581944, blue: 0.5764445066, alpha: 1)
        
        contentView.addSubview(myButton)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.borderWidth = 1
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(mainLabelText: String, descriptionLabelText: String, imageName: String) {
        mainLabel.text = mainLabelText
        descriptionLabel.text = descriptionLabelText
        myButton.setBackgroundImage(UIImage(named: imageName), for: UIControl.State.normal)
    }
    
    override func prepareForReuse() {
        mainLabel.text = nil
        descriptionLabel.text = nil
        myImageView.image = nil
    }
    
    @objc private func myButtonTapped() {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins) //пробелы между ячейками
        
        let imageSize = contentView.frame.size.height/2.5
        let width = contentView.frame.size.width - myImageView.frame.size.width - 40 * 3
        
        mainLabel.frame = CGRect(x: imageSize + 40,
                                 y: 17,
                                 width: width,
                                 height: 25)
        
        descriptionLabel.frame = CGRect(x: imageSize + 40,
                                        y: mainLabel.frame.size.height + 20,
                                        width: 1000,
                                        height: 25)
        
        myButton.frame = CGRect(x: 22,
                                y: (contentView.frame.size.height-imageSize)/2,
                                width: imageSize,
                                height: imageSize)
    }
}

