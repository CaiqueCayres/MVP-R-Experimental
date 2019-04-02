//  LoginProtocols.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

// PRESENTER -> VIEW
protocol LoginViewProtocol {

}

// VIEW -> PRESENTER
protocol LoginPresenterProtocol: Presenter {

    func didPressLogin()
}

// PRESENTER -> Router
protocol LoginRouterProtocol {

    func goToApp()
}
