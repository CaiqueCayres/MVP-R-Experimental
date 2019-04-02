//
//  AppDelegate.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        return UIWindow()
    }()

    lazy var rootRouter: MainRouter = {
        guard let window = self.window else { fatalError("Failed to create window") }
        let rootPresenter = MainRouter(window: window)
        return rootPresenter
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        rootRouter.startModule()
        return true
    }
}

 
