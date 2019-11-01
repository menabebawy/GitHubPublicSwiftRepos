//
//  PersonCollectionViewCell.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/30/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import UIKit
import Entities

final class OwnerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var personImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(person: Owner) {
        nameLabel.text = person.login
    }

}
