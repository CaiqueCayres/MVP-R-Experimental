//  DetailsPresenter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class DetailsPresenter: Presenter {
    
    let view: DetailsViewProtocol
    let router: DetailsRouterProtocol
    let character: Character
    
    init(from viewController: DetailsViewProtocol,
         and origin: DetailsRouterProtocol,
         char: Character) {
        view = viewController
        router = origin
        character = char
    }
}

extension DetailsPresenter: DetailsPresenterProtocol {

    func viewWillAppear() {

        if let name = character.name {
            view.infos(present: name)
        }

        if let url = character.image {
            view.image(for: url)
        }
    }
}








