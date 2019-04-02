//  LoginRouter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class LoginRouter: NavigationRouter {

    var navigationController: UINavigationController
    var next: Router?
    var view: UIViewController?

    init(dependencies: Dependencies) {
        navigationController = dependencies.preController
    }

    func loadPatterns() {
        let vc = LoginView()
        vc.presenter = LoginPresenter(from: vc, and: self)
        view = vc
    }
}

extension LoginRouter: LoginRouterProtocol {

    func goToApp() {
        let dependencies = SelectionRouter.Dependencies(preController: navigationController)
        next = SelectionRouter(dependencies: dependencies)
        next?.startModule()
    }
}

extension LoginRouter {

    struct Dependencies {
        var preController: UINavigationController
    }
}
