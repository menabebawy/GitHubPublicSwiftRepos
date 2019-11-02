//
//  RepositoryDetailsTableViewController.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Entities

final class RepositoryModuleTableViewController: UITableViewController {

    private var numberOfItems: Int {
        return 4
    }

    public var repository: Repository? {
        didSet {
            tableView.reloadData()
            viewToPresenterProtocol.showContributors(fullName: repository?.full_name ?? "")
        }
    }

    var viewToPresenterProtocol: RepositoryModulePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "SizeCell")
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "StargazersCell")
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "StargazersCell")
        tableView.register(UINib(nibName: "ContributorsTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "ContributorsCell")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let repository = repository else { return UITableViewCell() }

        var cell: UITableViewCell

        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell", for: indexPath)
            cell.textLabel?.text = "Size"
            cell.detailTextLabel?.text = "\(repository.size)"
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "StargazersCell", for: indexPath)
            cell.textLabel?.text = "Stargazers"
            cell.detailTextLabel?.text = "\(repository.stargazers_count)"
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "StargazersCell", for: indexPath)
            cell.textLabel?.text = "Forks count"
            cell.detailTextLabel?.text = "\(repository.forks_count)"
        default:
            guard let contributorsCell = tableView.dequeueReusableCell(withIdentifier: "ContributorsCell", for: indexPath) as? ContributorsTableViewCell else {
                return UITableViewCell()
            }
            cell = contributorsCell
        }

        return cell
    }

}

// MARK: - Repository module presenter to view

extension RepositoryModuleTableViewController: RepositoryModulePresenterToView {
    func showContributors(_ contributors: [Owner]) {
        let contributorsIndexPath = IndexPath(row: 3, section: 0)
        let cell = tableView.cellForRow(at: contributorsIndexPath) as? ContributorsTableViewCell
        cell?.contributors = contributors
        cell?.delegate = self
    }

    func showErrorMessage() {
    }

}

// MARK: - Contributors table view cell delegate

extension RepositoryModuleTableViewController: ContributorsTableViewCellDelegate {
    func contributorsTableViewCell(_ cell: ContributorsTableViewCell, didSelect contributor: Owner) {
        viewToPresenterProtocol.showContributorDetails(contributor, from: self)
    }

}
