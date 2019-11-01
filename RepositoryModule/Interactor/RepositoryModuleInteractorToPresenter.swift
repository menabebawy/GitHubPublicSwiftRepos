//
//  RepositoryModuleInteractorToPresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

protocol RepositoryModuleInteractorToPresenter {
    func fetched(contributors: [Owner])
    func failedToFetchRepositories(error: Error)
}
