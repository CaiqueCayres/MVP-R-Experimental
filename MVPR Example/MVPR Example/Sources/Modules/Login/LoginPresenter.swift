//  LoginPresenter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class LoginPresenter {
    
    let view: LoginViewProtocol
    let router: LoginRouterProtocol
    
    init(from viewController: LoginViewProtocol, and origin: LoginRouterProtocol) {
        view = viewController
        router = origin
    }
}

extension LoginPresenter: LoginPresenterProtocol {

    func didPressLogin() {
        router.goToApp()
    }
}








