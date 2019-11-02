//
//  RepositoryModuleViewToPresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

protocol RepositoryModuleViewToPresenter {
    func showContributors(fullName: String)
    func showContributorDetails(_ contributor: Owner, from view: RepositoryModulePresenterToView)
}
