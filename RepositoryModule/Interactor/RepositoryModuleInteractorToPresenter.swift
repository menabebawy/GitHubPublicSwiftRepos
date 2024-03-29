//
//  RepositoryModuleInteractorToPresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Entities

protocol RepositoryModuleInteractorToPresenter {
    func fetched(contributors: [Contributor])
    func failedToFetchRepositories(error: Error)
}
