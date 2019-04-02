//  CharactersRouter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class CharactersRouter: NavigationRouter {

    var next: Router?

    var navigationController: UINavigationController
    var view: UIViewController?

    init(dependencies: Dependencies) {
        navigationController = dependencies.preController
    }

    func loadPatterns() {

        //Utilizei o .create() para aproveitar a view de load no storyboard - eveite usar .create(), caso possua uma view para instanciar, utilize um xib
        guard let vc = CharactersView.create() else { return }
        vc.presenter = CharactersPresenter(from: vc, and: self)
        view = vc
    }
}

extension CharactersRouter: CharactersRouterProtocol {

    func loadDetails(for character: Character) {

        let dependencies = DetailsRouter.Dependencies(preController: navigationController, character: character)
        next = DetailsRouter(dependencies: dependencies)
        next?.startModule()
    }
}

extension CharactersRouter {

    struct Dependencies {
        var preController: UINavigationController
    }
}
