//
//  RepositoryModuleViewToPresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Entities

protocol RepositoryModuleViewToPresenter {
    func showContributors(fullName: String)
    func showContributorDetails(_ contributor: Contributor, from view: RepositoryModulePresenterToView)
}
