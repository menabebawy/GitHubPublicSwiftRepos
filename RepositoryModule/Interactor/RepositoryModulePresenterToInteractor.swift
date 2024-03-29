//
//  RepositoryModulePresenterToInteractor.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Foundation

protocol RepositoryModulePresenterToInteractor {
    func fetchContributors(forRepositoryFullName fullName: String)
}
