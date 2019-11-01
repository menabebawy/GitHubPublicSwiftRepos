//
//  RepositoryModuleInitalizer.swift
//  GitHubPublicSwiftRepos
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Foundation

final class RepositoryModuleInitalizer: NSObject {
    @IBOutlet weak private var repositoryModuleViewController: RepositoryModuleTableViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = RepositoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: repositoryModuleViewController)
    }

}
