//
//  RepositoriesModuleConfigurator.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Foundation

final class RepositoriesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? RepositoriesModuleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RepositoriesModuleViewController) {
        let presenter = RepositoriesModulePresenter()
        presenter.view = viewController
        
        let interactor = RepositoriesModuleInteractor()
        interactor.interactorToPresenterProtocol = presenter
        
        presenter.interactor = interactor
        viewController.viewToPresenterProtocol = presenter
    }
}
