//
//  RepositoryModulePresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Entities

final class RepositoryModulePresenter {
    weak var view: RepositoryModulePresenterToView!
    var interactor: RepositoryModulePresenterToInteractor!
    var router: RepositoryModulePresenterToRouter!
}

// MARK: - Repositories module view to presenter

extension RepositoryModulePresenter: RepositoryModuleViewToPresenter {
    func showContributors(fullName: String) {
        interactor.fetchContributors(forRepositoryFullName: fullName)
    }

    func showContributorDetails(_ contributor: Contributor, from view: RepositoryModulePresenterToView) {
        router.presentContributorDetails(contributor, from: view)
    }

}

// MARK: - Repositories module interactor to presenter

extension RepositoryModulePresenter: RepositoryModuleInteractorToPresenter {
    func fetched(contributors: [Contributor]) {
        view.showContributors(contributors)
    }

    func failedToFetchRepositories(error: Error) {
        view.showErrorMessage()
    }

}
