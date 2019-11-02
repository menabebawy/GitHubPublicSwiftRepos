//
//  ContributorCollectionViewCell.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Kingfisher

final class ContributorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var contributorImageView: UIImageView!
    @IBOutlet weak private var contributorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        contributorImageView.makeCircle()
    }

    func configureContributor(name: String, avatarUrlString: String) {
        contributorLabel.text = name
        contributorImageView.kf.setImage(with: URL(string: avatarUrlString))
    }

}
