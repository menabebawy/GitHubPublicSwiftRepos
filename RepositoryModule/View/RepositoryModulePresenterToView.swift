//
//  RepositorModulePresneterToView.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Entities

protocol RepositoryModulePresenterToView: class {
    func showContributors(_ contributors: [Owner])
    func showErrorMessage()
}
