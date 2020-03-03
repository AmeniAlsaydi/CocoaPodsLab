//
//  UserView.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import SnapKit

class UserView: UIView {

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        return cv
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
        constrainCV()
    }
    
    // constraints
    
    private func constrainCV() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
          make.top.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }

}
