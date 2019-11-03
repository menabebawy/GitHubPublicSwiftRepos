//
//  RepositoryModulePresenterToRouter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Entities

protocol RepositoryModulePresenterToRouter {
    func presentContributorDetails(_ contributor: Contributor, from view: RepositoryModulePresenterToView)
}
