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
        //imageView.image = UIImage(named: "checkmark")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17,weight:.bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9564295411, green: 0.9725391269, blue: 0.9768132567, alpha: 1)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        //contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        myLabel.text = text
        myImageView.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        myLabel.text = nil
        myImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height/2
        
        myLabel.frame = CGRect(x: imageSize + 20,
                               y: (contentView.frame.size.height-myLabel.frame.size.height)/2,
                               width: 100,
                               height: 25)
        
        myImageView.frame = CGRect(x: 10,
                                   y: (contentView.frame.size.height-imageSize)/2,
                                   width: imageSize,
                                   height: imageSize)
        
    }
    
    
}