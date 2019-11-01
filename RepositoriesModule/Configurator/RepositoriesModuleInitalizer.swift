//
//  RepositoriesModuleInitalizer.swift
//  RepositoriesModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Foundation

final class RepositoriesModuleInitalizer: NSObject {
    @IBOutlet weak private var repositoriesModuleViewController: RepositoriesModuleViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = RepositoriesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: repositoriesModuleViewController)
    }

}
