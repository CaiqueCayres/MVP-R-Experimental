//
//  MainNavigationController.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationBar.barStyle = .blackTranslucent
        navigationBar.tintColor = .white
    }
}

extension MainNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {

        switch viewController {
        case is LoginView: navigationController.navigationBar.isHidden = true
        default: navigationController.navigationBar.isHidden = false
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    }
}
