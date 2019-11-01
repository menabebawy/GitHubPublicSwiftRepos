//
//  RepositoriesModuleInteractorToPresenter.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

protocol RepositoriesModuleInteractorToPresenter: class {
    func fetched(repositories: [Repository])
    func failedToFetchRepositories(error: Error)
}
