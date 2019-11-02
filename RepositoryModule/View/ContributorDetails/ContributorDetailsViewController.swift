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
    @IBOutlet weak private var totalCommitsLabel: UILabel!
    @IBOutlet weak private var weeksInfoTableView: UITableView!
    @IBOutlet weak private var seperatorDividorView: UIView!

    var contributor: Contributor!

    override func viewDidLoad() {
        super.viewDidLoad()
        seperatorDividorView.isHidden = true
        imageView.makeCircle()
        nameLabel.text = contributor.author.login
        totalCommitsLabel.text = "\(contributor.total)"
        imageView.kf.setImage(with: URL(string: contributor.author.avatar_url))
        weeksInfoTableView.register(WeekInfoTableViewCell.nib(), forCellReuseIdentifier: "WeekInfoCell")
    }

}

// MARK: - Table view data source

extension ContributorDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contributor.weeks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeekInfoCell", for: indexPath) as? WeekInfoTableViewCell else {
                return UITableViewCell()
        }
        cell.configure(week: contributor.weeks[indexPath.row])
        return cell
    }

}

extension ContributorDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        seperatorDividorView.isHidden = true
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y != 0 {
            seperatorDividorView.isHidden = false
        }
    }
}
