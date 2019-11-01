//
//  RepositoryModuleRouter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities
import UIKit

final class RepositoryModuleRouter {

    func    push(from view: UIViewController, repository: Repository) {
        let storyboard = UIStoryboard(name: "Repository", bundle: .main)
        guard let viewController = storyboard.instantiateInitialViewController() as? RepositoryModuleTableViewController else { return }
        viewController.repository = repository
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Repositories module presenter to router

extension RepositoryModuleRouter: RepositoryModulePresenterToRouter {

}
