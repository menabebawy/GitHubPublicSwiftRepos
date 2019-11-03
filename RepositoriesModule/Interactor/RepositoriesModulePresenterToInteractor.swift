//
//  RepositoriesModulePresenterToInteractor.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Foundation

protocol RepositoriesModulePresenterToInteractor {
    func fetchRepositories(pageIndex: Int, perPage: Int)
}
