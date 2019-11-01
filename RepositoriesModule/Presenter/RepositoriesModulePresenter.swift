//
//  RepositoriesModulePresenter.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

final class RepositoriesModulePresenter {
    weak var view: RepositoriesModulePresenterToView!
    var interactor: RepositoriesModulePresenterToInteractor!
    var router: RepositoriesModulePresenterToRouter!
}

extension RepositoriesModulePresenter: RepositoriesModuleViewToPresenter {
    func viewIsReady() {
        interactor.fetchRepositories()
    }

    func showDetailsScreen(for repository: Repository) {
        router.openRecipeDetailsScreen(with: repository)
    }

}

extension RepositoriesModulePresenter: RepositoriesModuleInteractorToPresenter {
    func fetched(repositories: [Repository]) {
        view.showRepositories(repositories: repositories)
    }

    func failedToFetchRecipes(error: Error) {
        view.showErrorMessage()
    }

}
