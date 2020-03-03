//
//  UserCell.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

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
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        return label
    }()
    
    public func configureCell(user: User) {
        nameLabel.text = "\(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
        
        // add images 
    }
    
    // constraints
    
}
