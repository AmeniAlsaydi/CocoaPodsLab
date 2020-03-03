//
//  ViewController.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    private let usersView = UserView()
    
    override func loadView() {
        view = usersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }


}

