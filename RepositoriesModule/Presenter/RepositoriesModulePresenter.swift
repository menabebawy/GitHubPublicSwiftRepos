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

// MARK: - Repositories module view to presenter

extension RepositoriesModulePresenter: RepositoriesModuleViewToPresenter {
   func viewIsReady() {
        interactor.fetchRepositories()
    }

    func showRepositoryDetailsScreen(_ repository: Repository, from view: RepositoriesModulePresenterToView) {
           router.openRepositoryDetailsScreen(repository, from: view)
       }

}

// MARK: - Repositories module interactor to presenter

extension RepositoriesModulePresenter: RepositoriesModuleInteractorToPresenter {
    func fetched(repositories: [Repository]) {
        view.showRepositories(repositories: repositories)
    }

    func failedToFetchRepositories(error: Error) {
        view.showErrorMessage()
    }

}
