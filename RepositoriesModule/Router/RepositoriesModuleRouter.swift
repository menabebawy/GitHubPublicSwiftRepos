//
//  RepositoriesModuleRouter.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities
import UIKit

final class RepositoriesModuleRouter {
}

// MARK: - Repositories module presenter to router

extension RepositoriesModuleRouter: RepositoriesModulePresenterToRouter {
    func openRepositoryDetailsScreen(_ repository: Repository, from view: RepositoriesModulePresenterToView) {
        guard let view = view as? RepositoriesModuleViewController else { return }
        let repositoryRouter = RepositoryModuleRouter()
        repositoryRouter.push(from: view, repository: repository)
    }

}
