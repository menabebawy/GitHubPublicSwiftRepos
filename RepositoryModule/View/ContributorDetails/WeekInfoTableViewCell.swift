//
//  WeekInfoTableViewCell.swift
//  RepositoryModule
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Entities
import Utils

final class WeekInfoTableViewCell: UITableViewCell {
    @IBOutlet weak private var weekLabel: UILabel!
    @IBOutlet weak private var numberOfAdditionsLabel: UILabel!
    @IBOutlet weak private var numberOfDeletionsLabel: UILabel!
    @IBOutlet weak private var numberOfCommitsLabel: UILabel!

    func configure(week: Week) {
        weekLabel.text = DateFormatterBuilder(timeStamp: week.startOfWeek).medium().build()
        numberOfAdditionsLabel.text = "\(week.numberOfAdditions)"
        numberOfDeletionsLabel.text = "\(week.numberOfDeletions)"
        numberOfCommitsLabel.text = "\(week.numberOfCommits)"
    }

}
