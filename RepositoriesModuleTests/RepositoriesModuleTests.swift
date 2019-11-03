//
//  RepositoriesModuleTests.swift
//  RepositoriesModuleTests
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import XCTest
@testable import RepositoriesModule

class RepositoriesModuleTests: XCTestCase {

    func testConfigureModuleForViewController() {
        //given
        let viewController = RepositoriesModuleViewControllerMock()
        let configurator = RepositoriesModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.viewToPresenterProtocol,
                        "RepositoriesModuleViewController is nil after configuration")

        XCTAssertTrue(viewController.viewToPresenterProtocol != nil,
                      "output is not AuthenticationModulePresenter")

        let presenter: RepositoriesModulePresenter = viewController.viewToPresenterProtocol!
        XCTAssertNotNil(presenter.view,
                        "view in AuthenticationModulePresenter is nil after configuration")

        if let interactor: RepositoriesModuleInteractor = presenter.interactor as? RepositoriesModuleInteractor {
            XCTAssertNotNil(interactor.interactorToPresenterProtocol,
                            "output in AuthenticationModuleInteractor is nil after configuration")
        }
    }

}

class RepositoriesModuleViewControllerMock: RepositoriesModuleViewController {
    var setupInitialStateDidCall = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialStateDidCall = true
    }

}
