//
//  MainRouter.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: RootRouter {

    var window: UIWindow?
    var view: UIViewController?
    var next: Router?

    init(window: UIWindow) {
        self.window = window
        view = MainNavigationController()
        self.window?.rootViewController = view
        
    }

    func startModule() {
        //Fazendo quaisquer validacoes iniciais
        guard let root = window?.rootViewController as? MainNavigationController else { return }
        let dependencies = LoginRouter.Dependencies(preController: root)
        next = LoginRouter(dependencies: dependencies)
        next?.startModule()
    }
}
