//  SelectionProtocols.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

// PRESENTER -> VIEW
protocol SelectionViewProtocol {
    
}

// VIEW -> PRESENTER
protocol SelectionPresenterProtocol: Presenter {

    func didPressCharButton()
    func didPressEpisButton()
}

// PRESENTER -> Router
protocol SelectionRouterProtocol {

    func loadCharList()
    func loadEpisodesList()
}
