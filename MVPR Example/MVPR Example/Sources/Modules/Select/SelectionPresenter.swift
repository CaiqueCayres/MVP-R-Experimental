//  SelectionPresenter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class SelectionPresenter {
    
    let view: SelectionViewProtocol
    let router: SelectionRouterProtocol
    
    init(from viewController: SelectionViewProtocol, and origin: SelectionRouterProtocol) {
        view = viewController
        router = origin
    }
}

extension SelectionPresenter: SelectionPresenterProtocol {

    func didPressCharButton() {
        router.loadCharList()
    }

    func didPressEpisButton() {
        router.loadEpisodesList()
    }
}
