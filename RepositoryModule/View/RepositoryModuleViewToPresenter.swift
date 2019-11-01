//
//  RepositoryModuleViewToPresenter.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Foundation

protocol RepositoryModuleViewToPresenter {
    func viewIsReady()
    func showContributors(fullName: String)
}