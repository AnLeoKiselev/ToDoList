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
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20,weight:.semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Домашние дела"
        label.font = .systemFont(ofSize: 17,weight:.light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        mainLabel.text = text
        myImageView.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        mainLabel.text = nil
        myImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins) //пробелы между ячейками
        
        let imageSize = contentView.frame.size.height/2.5
        
        mainLabel.frame = CGRect(x: imageSize + 40,
                               y: 17,
                               width: 1000,
                               height: 25)
        
        descriptionLabel.frame = CGRect(x: imageSize + 40,
                               y: mainLabel.frame.size.height + 20,
                               width: 1000,
                               height: 25)
        
        myImageView.frame = CGRect(x: 22,
                                   y: (contentView.frame.size.height-imageSize)/2,
                                   width: imageSize,
                                   height: imageSize)
    }
}
