//  SelectionView.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class SelectionView: UIViewController {
    
    @IBOutlet weak var charactersButton: UIButton?
    @IBOutlet weak var episodesButton: UIButton?

    var presenter: SelectionPresenterProtocol?

    @IBAction func charButtonAction(_ sender: UIButton) {
        presenter?.didPressCharButton()
    }

    @IBAction func episodesButtonAction(_ sender: UIButton) {
        presenter?.didPressEpisButton()
    }
}

extension SelectionView: SelectionViewProtocol {
    
}
