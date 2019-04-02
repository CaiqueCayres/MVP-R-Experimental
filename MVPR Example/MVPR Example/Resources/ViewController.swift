//
//  ViewController.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.rootRouter.next?.startModule()
    }
}

