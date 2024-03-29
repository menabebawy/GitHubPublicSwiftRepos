//
//  RepositoryDetailsTableViewController.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import UIKit
import Entities

public class RepositoryModuleTableViewController: UITableViewController {

    private var numberOfItems: Int {
        return 4
    }

    public var repository: Repository? {
        didSet {
            guard let repository = repository else { return }
            title = repository.name
            tableView.reloadData()
            viewToPresenterProtocol.showContributors(fullName: repository.fullName)
        }
    }

    var viewToPresenterProtocol: RepositoryModulePresenter!

    override public func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "SizeCell")
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "StargazersCell")
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "StargazersCell")
        tableView.register(ContributorsTableViewCell.nib(), forCellReuseIdentifier: "ContributorsCell")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            cell.detailTextLabel?.text = "\(repository.stargazersCount)"
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "StargazersCell", for: indexPath)
            cell.textLabel?.text = "Forks count"
            cell.detailTextLabel?.text = "\(repository.forksCount)"
        default:
            guard let contributorsCell = tableView.dequeueReusableCell(
                withIdentifier: "ContributorsCell", for: indexPath) as? ContributorsTableViewCell else {
                    return UITableViewCell()
            }
            cell = contributorsCell
        }

        cell.selectionStyle = .none
        return cell
    }

}

// MARK: - Repository module presenter to view

extension RepositoryModuleTableViewController: RepositoryModulePresenterToView {
    func showContributors(_ contributors: [Contributor]) {
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
    func contributorsTableViewCell(_ cell: ContributorsTableViewCell, didSelect contributor: Contributor) {
        viewToPresenterProtocol.showContributorDetails(contributor, from: self)
    }

}
