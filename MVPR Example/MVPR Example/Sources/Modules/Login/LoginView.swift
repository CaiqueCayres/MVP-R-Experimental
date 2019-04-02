//  LoginView.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var goAppButton: UIButton?

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    @IBAction func goAppAction(_ sender: UIButton) {
        presenter?.didPressLogin()
    }
}

extension LoginView: LoginViewProtocol {

  
}
