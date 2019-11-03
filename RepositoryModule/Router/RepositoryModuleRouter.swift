//
//  RepositoryModuleRouter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Entities
import UIKit

final class RepositoryModuleRouter {

    private var storyboard: UIStoryboard {
        return UIStoryboard(name: "Repository", bundle: .main)
    }

    private var repositoryViewController: RepositoryModuleTableViewController? {
        return storyboard.instantiateInitialViewController() as? RepositoryModuleTableViewController
    }

    private var contributorDetailsViewController: ContributorDetailsViewController? {
        let identifier = String(describing: ContributorDetailsViewController.self)
        return storyboard.instantiateViewController(identifier: identifier)
    }

    func push(from view: UIViewController, repository: Repository) {
        guard let viewController = repositoryViewController else { return }
        viewController.repository = repository
        view.navigationController?.pushViewController(viewController, animated: true)
    }

}

// MARK: - Repositories module presenter to router

extension RepositoryModuleRouter: RepositoryModulePresenterToRouter {
    func presentContributorDetails(_ contributor: Contributor, from view: RepositoryModulePresenterToView) {
        guard let view = view as? UIViewController,
            let contributorDetailsViewController = contributorDetailsViewController else { return }
        contributorDetailsViewController.contributor = contributor
        view.present(contributorDetailsViewController, animated: true, completion: nil)
    }

}
