//
//  MainNavigationController.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Entities
import RepositoryModule
import RepositoriesModule

final class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Repositories", bundle: .main)
        guard let repositoriesViewController = storyboard.instantiateInitialViewController()
            as? RepositoriesModuleViewController else {
                return
        }
        repositoriesViewController.delegate = self
        pushViewController(repositoriesViewController, animated: true)
    }

}

// MARK: -

extension MainNavigationController: RepositoriesModuleViewControllerDelegate {
    func repositoriesModuleViewController(_ controller: RepositoriesModuleViewController,
                                          didSelect repository: Repository) {
        let storyboard = UIStoryboard(name: "Repository", bundle: .main)
        guard let repositoryViewController = storyboard.instantiateInitialViewController()
            as? RepositoryModuleTableViewController else {
                return
        }
        repositoryViewController.repository = repository
        pushViewController(repositoryViewController, animated: true)
    }

}
