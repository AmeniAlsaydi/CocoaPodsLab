//
//  DetailView.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class DetailView: UIView {

    public lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 13
        return iv
    }()
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        constrainImage()
        //constrainName()
        //constrainEmail()
    }
    
    private func constrainImage() {
        addSubview(userImage)
            
        userImage.snp.makeConstraints { (make) in
            
            make.height.equalTo(self).multipliedBy(0.5)
            make.leading.equalTo(self).offset(0)
            make.trailing.equalTo(self).offset(0)
            make.top.equalTo(self).offset(0)
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
