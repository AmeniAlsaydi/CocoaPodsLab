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
        
        detailView.nameLabel.text = "\(user.name.first) \(user.name.last)"
        detailView.emailLabel.text = "Email: \(user.email)"
        let imageUrl = URL(string: user.picture.large)
        detailView.userImage.kf.setImage(with: imageUrl)
        let address = "\(user.location.street.number) \(user.location.street.name) \(user.location.city) \(user.location.state) \(user.location.postcode)"
        detailView.addressLabel.text = "Address: \(address)"
        detailView.phoneNumLabel.text = "Phone number: \(user.phone)"

        //format the bday
        let isoDateFormatter = ISO8601DateFormatter()
            isoDateFormatter.formatOptions = [.withInternetDateTime,
                                              .withDashSeparatorInDate,
                                              .withFullDate,
                                              .withFractionalSeconds,
                                              .withColonSeparatorInTimeZone]
            isoDateFormatter.timeZone = TimeZone.current
        
            
            let timestampString = user.dob.date
            if let date = isoDateFormatter.date(from: timestampString) {
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "MMMM, dd, yyyy"
              let dateFormattedString = dateFormatter.string(from: date)
              detailView.bdayLabel.text = "DOB: \(dateFormattedString)"
            } else {
              print("not a valid date")
            }

    }

}
