//  DetailsRouter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class DetailsRouter: NavigationRouter {

    let dependencies: Dependencies
    var navigationController: UINavigationController

    var next: Router?
    var view: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        self.navigationController = dependencies.preController
    }

    func loadPatterns() {
        let vc = DetailsView()
        vc.presenter = DetailsPresenter(from: vc, and: self, char: dependencies.character)
        view = vc
    }
}

extension DetailsRouter: DetailsRouterProtocol {

}

extension DetailsRouter {

    struct Dependencies {
        var preController: UINavigationController
        var character: Character
    }
}
