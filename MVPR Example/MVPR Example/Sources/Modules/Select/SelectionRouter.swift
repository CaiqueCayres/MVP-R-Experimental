//  SelectionRouter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class SelectionRouter: NavigationRouter {

    var next: Router?

    var navigationController: UINavigationController
    var view: UIViewController?

    init(dependencies: Dependencies) {
        navigationController = dependencies.preController
    }

    func loadPatterns() {
        let vc = SelectionView()
        vc.presenter = SelectionPresenter(from: vc, and: self)
        view = vc
    }
}

extension SelectionRouter: SelectionRouterProtocol {

    func loadCharList() {
        let dependencies = CharactersRouter.Dependencies(preController: navigationController)
        next = CharactersRouter(dependencies: dependencies)
        next?.startModule()
    }

    func loadEpisodesList() {
        //delete a linha abaixo
        let vc = EpisodesView()
        navigationController.pushViewController(vc, animated: true)
    }
}

extension SelectionRouter {

    struct Dependencies {
        var preController: UINavigationController
    }
}
