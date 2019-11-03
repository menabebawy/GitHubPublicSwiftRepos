//
//  RepositoriesModulePresenterToView.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Entities

protocol RepositoriesModulePresenterToView: class {
    func reloadTableView(by repositories: [Repository])
    func updateTableView(by repositories: [Repository], perPage: Int)
    func showErrorMessage()
    func viewWillAppear()
}
