//
//  RepositoriesModuleViewToPresenter.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

protocol RepositoriesModuleViewToPresenter {
    func fetchRepositories()
    func showRepositoryDetailsScreen(_ repository: Repository, from view: RepositoriesModulePresenterToView)
}

