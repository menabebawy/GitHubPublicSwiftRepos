//
//  RepositoryModuleInteractor.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Networking
import Entities

final class RepositoryModuleInteractor {
    var interactorToPresenterProtocol: RepositoryModuleInteractorToPresenter!
    let sessionProvider = URLSessionProvider()
}

// MARK: - Repositories module presenter to interactor

extension RepositoryModuleInteractor: RepositoryModulePresenterToInteractor {
    func fetchContributors(forRepositoryFullName fullName: String) {
        let service = GitHubService.contributors(fullname: fullName)
        sessionProvider.request(type: [Contributor].self, service: service) { [weak self] response in
            guard let `self` = self else { return }
            switch response {
            case let .success(contributors):
                self.interactorToPresenterProtocol.fetched(contributors: contributors)
            case let .failure(error):
                self.interactorToPresenterProtocol.failedToFetchRepositories(error: error)
            }
        }
    }

}

