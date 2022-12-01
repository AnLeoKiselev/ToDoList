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
        //imageView.layer.cornerRadius = 10
        return imageView
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
        contentView.backgroundColor = #colorLiteral(red: 0.2274511456, green: 0.2183080614, blue: 0.2804787457, alpha: 1)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
        contentView.layer.cornerRadius = 10
        //contentView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // !!!
        //contentView.layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(mainLabelText: String, descriptionLabelText: String, imageName: String) {
        mainLabel.text = mainLabelText
        descriptionLabel.text = descriptionLabelText
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
        let width = contentView.frame.size.width - myImageView.frame.size.width - 40 * 3
        
        mainLabel.frame = CGRect(x: imageSize + 40,
                                 y: 17,
                                 width: width,
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

