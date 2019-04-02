//  CharactersProtocols.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

// PRESENTER -> VIEW
protocol CharactersViewProtocol {

    func requests(inRequest start: Bool)
    func reloadTable()
}

// VIEW -> PRESENTER
protocol CharactersPresenterProtocol: Presenter {

    func loadMoreChars()

    var numberOfRows: Int { get }

    func character(forIndex i: Int) -> Character?
    func didSelect(for index: Int)
}

// PRESENTER -> Router
protocol CharactersRouterProtocol {

    func loadDetails(for character: Character)

}
