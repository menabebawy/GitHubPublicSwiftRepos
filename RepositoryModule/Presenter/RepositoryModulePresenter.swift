//
//  RepositoryModulePresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

final class RepositoryModulePresenter {
    weak var view: RepositoryModulePresenterToView!
    var interactor: RepositoryModulePresenterToInteractor!
    var router: RepositoryModulePresenterToRouter!
}

// MARK: - Repositories module view to presenter

extension RepositoryModulePresenter: RepositoryModuleViewToPresenter {
    func viewIsReady() {
//        interactor.fetchRepositories()
    }

    func showContributors(fullName: String) {
    }

}

// MARK: - Repositories module interactor to presenter

extension RepositoryModulePresenter: RepositoryModuleInteractorToPresenter {
    func fetched(contributors: [Owner]) {
        
    }

    func failedToFetchRepositories(error: Error) {
        view.showErrorMessage()
    }

}

