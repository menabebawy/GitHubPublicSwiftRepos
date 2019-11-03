//
//  RepositoryModuleConfigurator.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Foundation

final class RepositoryModuleConfigurator {

    func configureModuleForViewInput<T>(viewInput: T) {
        if let viewController = viewInput as? RepositoryModuleTableViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RepositoryModuleTableViewController) {
        let router = RepositoryModuleRouter()

        let presenter = RepositoryModulePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RepositoryModuleInteractor()
        interactor.interactorToPresenterProtocol = presenter

        presenter.interactor = interactor
        viewController.viewToPresenterProtocol = presenter
    }
}
