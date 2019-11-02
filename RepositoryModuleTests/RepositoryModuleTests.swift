//
//  RepositoryModuleTests.swift
//  RepositoryModuleTests
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import XCTest
@testable import RepositoryModule

class RepositoryModuleTests: XCTestCase {

    func testConfigureModuleForViewController() {
        //given
        let viewController = RepositoryModuleViewControllerMock()
        let configurator = RepositoryModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.viewToPresenterProtocol,
                        "RepositoriesModuleViewController is nil after configuration")

        XCTAssertTrue(viewController.viewToPresenterProtocol != nil,
                      "output is not AuthenticationModulePresenter")

        let presenter: RepositoryModulePresenter = viewController.viewToPresenterProtocol!
        XCTAssertNotNil(presenter.view,
                        "view in AuthenticationModulePresenter is nil after configuration")

        let interactor: RepositoryModuleInteractor = presenter.interactor as! RepositoryModuleInteractor
        XCTAssertNotNil(interactor.interactorToPresenterProtocol,
                        "output in AuthenticationModuleInteractor is nil after configuration")
    }

}

class RepositoryModuleViewControllerMock: RepositoryModuleTableViewController {
    var setupInitialStateDidCall = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialStateDidCall = true
    }

}
