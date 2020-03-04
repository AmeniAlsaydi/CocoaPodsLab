//
//  DetailViewController.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    private var detailView = DetailView()
    private var user: User
    
    init(_ user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI()

    }
    
    private func updateUI() {
        
        detailView.nameLabel.text = user.name.first
        detailView.emailLabel.text = user.email
        let imageUrl = URL(string: user.picture.large)
        detailView.userImage.kf.setImage(with: imageUrl)
    }

}
