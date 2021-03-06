//
//  UserCell.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class UserCell: UICollectionViewCell {
    
    private lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 13
        return iv
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    public func configureCell(user: User) {
        nameLabel.text = "\(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
        let imageUrl = URL(string: user.picture.medium)
        userImage.kf.setImage(with: imageUrl)
    }
    
    // constraints
    override init(frame: CGRect) {
        super.init(frame: frame) // for a cell
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        constrainImage()
        constrainName()
        constrainEmail()
    }
    
    private func constrainImage() {
        addSubview(userImage)
            
        userImage.snp.makeConstraints { (make) in
            
            make.height.equalTo(self).multipliedBy(0.9)
            make.leading.equalTo(self).offset(10)
            make.width.equalTo(self).multipliedBy(0.5)
            make.centerY.equalTo(self)
          
        }
        
    }
    
    private func constrainName() {
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.trailing.equalTo(self).offset(10)
            make.centerY.equalTo(self)
        }
        
    }
    
    private func constrainEmail() {
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.trailing.equalTo(self).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
    }
    
}
