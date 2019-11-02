//
//  ContributorDetailsViewController.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Entities
import Kingfisher

final class ContributorDetailsViewController: UIViewController {
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!

    var contributor: Owner!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        nameLabel.text = contributor.login
        imageView.kf.setImage(with: URL(string: contributor.avatar_url))
    }

}
