//
//  ViewController.swift
//  CocoaPodsLab
//
//  Created by Amy Alsaydi on 3/3/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import Kingfisher

class UsersViewController: UIViewController {
    
    private let usersView = UserView()
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.usersView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = usersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Random Users"
        usersView.collectionView.dataSource = self
        usersView.collectionView.delegate = self
        usersView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
        getUser()
        view.backgroundColor = .systemBackground
    }
    
    private func getUser() {
        ApiClient.getUsers { (result) in
            switch result {
            case .failure(let AfError):
                print("error getting users: \(AfError)")
            case .success(let users):
                self.users = users
                print(users.count)
            }
        }
    }
}

extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
             fatalError("could not downcast to userCell")
        }
        
        let user = users[indexPath.row]
        
        cell.configureCell(user: user)
        return cell
    }
    
}

extension UsersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth = maxSize.width
        
        let itemHeight = maxSize.height * 0.20
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let detailVC = DetailViewController(user)
        present(detailVC, animated: true)
    }
}

