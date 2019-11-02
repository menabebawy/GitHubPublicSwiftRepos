//
//  RepositoriesModuleViewController.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/30/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import UIKit
import Entities

final class RepositoriesModuleViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!

    private var repositories: [Repository] = []

    var viewToPresenterProtocol: RepositoriesModulePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.fetchRepositories()
        title = "Swift Public Repos"
    }

}

// MARK: - Repositories module presenter to view

extension RepositoriesModuleViewController: RepositoriesModulePresenterToView {
    func reloadTableView(by repositories: [Repository]) {
        self.repositories.append(contentsOf: repositories)
        tableView.reloadData()
    }

    func updateTableView(by repositories: [Repository], perPage: Int) {
        self.repositories.append(contentsOf: repositories)
        let lastRow = self.repositories.count
        let indexPaths = Array((lastRow - perPage)..<lastRow).map { IndexPath(row: $0, section: 0) }
        tableView.beginUpdates()
        tableView.insertRows(at: indexPaths, with: .none)
        tableView.endUpdates()
    }

    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching repos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

// MARK: - Table view data source

extension RepositoriesModuleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath)
        let repository = repositories[indexPath.row]
        cell.textLabel?.text = repository.name
        cell.detailTextLabel?.text = repository.full_name
        return cell
    }

}

// MARK: - Table view delegate

extension RepositoriesModuleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewToPresenterProtocol.showRepositoryDetailsScreen(repositories[indexPath.row], from: self)
    }

}

// MARK: - Table view prefeteching

extension RepositoriesModuleViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let isFetchMoreRepositories = indexPaths.contains(where: { $0.row == repositories.count - 1 })
        if isFetchMoreRepositories {
            viewToPresenterProtocol.fetchRepositories()
        }
    }

}
