//  MVPC Router Protocols
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

// Router
protocol Router: class {

    var view: UIViewController? { get set }
    var next: Router? { get }

    func startModule()
    func finishModule()
}

// Root
protocol RootRouter: Router {

    var window: UIWindow? { get }
}

extension RootRouter {

    func startModule() {
        window?.rootViewController = view
    }

    func finishModule() {}
}


// Showed
protocol ShowedRouter: Router {

    func loadPatterns()
    func show(viewController: UIViewController, animated: Bool)
}

extension ShowedRouter {

    func startModule() {
        loadPatterns()
        guard let vc = view else { return }
        show(viewController: vc, animated: true)
    }
}

// ViewController present Router
protocol PresentedRouter: ShowedRouter {

    var presentingViewController: UIViewController { get }
}

extension PresentedRouter {

    func startModule() {
        loadPatterns()
        guard let vc = view else { return }
        show(viewController: vc, animated: true)
    }

    func show(viewController: UIViewController, animated: Bool) {
        presentingViewController.present(viewController, animated: animated, completion: nil)
    }

    func finishModule() {
        view?.dismiss(animated: true, completion: nil)
    }
}

// NavigationController push Router
protocol NavigationRouter: ShowedRouter {

    var navigationController: UINavigationController { get }
}

extension NavigationRouter {

    func startModule() {
        loadPatterns()
        guard let vc = view else { return }
        show(viewController: vc, animated: true)
    }

    func show(viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    func finishModule() {
        navigationController.popViewController(animated: true)
    }
}


//TAB Router  - (Beta a.k.a. not finish)
protocol InTabBarRouter: Router {

    var tabBarController: UITabBarController { get }
    var item: UITabBarItem { get }
}

extension InTabBarRouter {

    func addToTabbar(_ viewController: UIViewController) {
        viewController.tabBarItem = item
        if tabBarController.viewControllers != nil {
            tabBarController.viewControllers?.append(viewController)
        } else {
            tabBarController.setViewControllers([viewController], animated: true)
        }
    }

    func finishModule() {
        tabBarController.dismiss(animated: true, completion: nil)
    }
}
