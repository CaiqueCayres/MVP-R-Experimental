//  DetailsProtocols.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

// PRESENTER -> VIEW
protocol DetailsViewProtocol {

    func image(for url: String)
    func infos(present name: String)
}

// VIEW -> PRESENTER
protocol DetailsPresenterProtocol: Presenter {
    
}

// PRESENTER -> Router
protocol DetailsRouterProtocol {

}
