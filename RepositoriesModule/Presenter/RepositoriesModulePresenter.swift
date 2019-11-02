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

    var pageIndex = 0
    let perPage = 25

}

// MARK: - Repositories module view to presenter

extension RepositoriesModulePresenter: RepositoriesModuleViewToPresenter {
    func fetchRepositories() {
        pageIndex += 1
        interactor.fetchRepositories(pageIndex: pageIndex, perPage: perPage)
    }

}

// MARK: - Repositories module interactor to presenter

extension RepositoriesModulePresenter: RepositoriesModuleInteractorToPresenter {
    func fetched(repositories: [Repository]) {
        pageIndex == 1 ? view.reloadTableView(by: repositories) : view.updateTableView(by: repositories, perPage: perPage)
    }

    func failedToFetchRepositories(error: Error) {
        view.showErrorMessage()
    }

}
