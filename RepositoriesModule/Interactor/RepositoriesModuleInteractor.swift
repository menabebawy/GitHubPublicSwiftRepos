//
//  RepositoriesModuleInteractor.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Networking
import Entities

final class RepositoriesModuleInteractor {
    var interactorToPresenterProtocol: RepositoriesModuleInteractorToPresenter!
    let sessionProvider = URLSessionProvider()
}

// MARK: - Repositories module presenter to interactor

extension RepositoriesModuleInteractor: RepositoriesModulePresenterToInteractor {
    func fetchRepositories(pageIndex: Int, perPage: Int) {
        let service = GitHubService.repositories(pageIndex: pageIndex, perPage: perPage)
        sessionProvider.request(type: Repositories.self, service: service) { response in
            switch response {
            case let .success(repositories):
                self.interactorToPresenterProtocol.fetched(repositories: repositories.items)
            case let .failure(error):
                self.interactorToPresenterProtocol.failedToFetchRepositories(error: error)
            }
        }
    }

}
