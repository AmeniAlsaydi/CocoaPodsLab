//
//  DetailView.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import SnapKit

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
        label.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        return label
    }()
    
    public lazy var bdayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.text = "Birthday"
        return label
    }()
    
    public lazy var phoneNumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.text = "Number"
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
        constrainName()
        constrainEmail()
        constrainAddress()
        constrainBday()
        constrainPhone()
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
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(20)
            make.top.equalTo(userImage.snp.bottom).offset(20)
        }
        
    }
    
    private func constrainEmail() {
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
    private func constrainAddress() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(20)
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
        }
    }
    
    private func constrainBday() {
        addSubview(bdayLabel)
        bdayLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(20)
            make.top.equalTo(addressLabel.snp.bottom).offset(20)
        }
    }
    
    private func constrainPhone() {
        addSubview(phoneNumLabel)
        phoneNumLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(20)
            make.top.equalTo(bdayLabel.snp.bottom).offset(20)
        }
    }
    

}
