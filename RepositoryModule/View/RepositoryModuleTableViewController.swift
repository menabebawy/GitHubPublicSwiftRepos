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

    public var repository: Repository? = nil {
        didSet {
            tableView.reloadData()
        }
    }

    var viewToPresenterProtocol: RepositoryModulePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
        clearsSelectionOnViewWillAppear = false
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "SizeCell")
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "StargazersCell")
        tableView.register(RightDetailsTableViewCell.self, forCellReuseIdentifier: "StargazersCell")
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
            cell.textLabel?.text = "\(repository.size)" + "Size"
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
            cell = UITableViewCell()
        }
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}

// MARK: - Repository module presenter to view

extension RepositoryModuleTableViewController: RepositoryModulePresenterToView {
    func showRepository(_ repository: Repository) {
        self.repository = repository
    }

    func showContributors(_ contributors: [Owner]) {
    }

    func showErrorMessage() {
    }

}
