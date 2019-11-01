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

    private var pageIndex = 1

    private var repositories: [Repository] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    var viewToPresenterProtocol: RepositoriesModulePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift Public Repos"
        viewToPresenterProtocol.viewIsReady()
    }

}

// MARK: - Repositories module presenter to view

extension RepositoriesModuleViewController: RepositoriesModulePresenterToView {
    func showRepositories(repositories: [Repository]) {
        self.repositories = repositories
    }

    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching recipes", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: - Table view data source

extension RepositoriesModuleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PublicSwiftRepoCell", for: indexPath)
        let repository = repositories[indexPath.row]
        cell.textLabel?.text = repository.name
        cell.detailTextLabel?.text = repository.full_name
        return cell
    }

}
