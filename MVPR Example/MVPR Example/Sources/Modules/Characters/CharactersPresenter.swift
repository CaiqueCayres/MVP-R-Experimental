//  CharactersPresenter.swift
//  MVPR Example
//
//  Copyright (c) 2019 MBLabs. All rights reserved.

import UIKit

class CharactersPresenter {
    
    let view: CharactersViewProtocol
    let router: CharactersRouterProtocol

    var lastInfos: InfosAPI?
    
    var charsDownloaded: [Character] = [] {
        didSet{
            charsList = charsDownloaded
        }
    }

    var charsList: [Character] = [] {
        didSet{
            view.reloadTable()
        }
    }

    init(from viewController: CharactersViewProtocol, and origin: CharactersRouterProtocol) {
        view = viewController
        router = origin
    }

    func requestChars(forPage page: Int) {

        view.requests(inRequest: true)

        let request: CharacterRequest = .charactersList(page)
        Network.request(request: request) { (result: Result<NetworkResponse<[Character]>>) in

            self.view.requests(inRequest: false)

            switch result {
            case let .success(characters):
                self.charsDownloaded.append(contentsOf: characters.results ?? [])
                self.lastInfos = characters.info

            case let .failure(error):
                print(error)
            }
        }
    }
}

extension CharactersPresenter: CharactersPresenterProtocol {

    func viewDidLoad() {
        requestChars(forPage: 1)
    }

    func loadMoreChars() {
        guard let nextPage = lastInfos?.next else { return }
        guard let numberString = nextPage.components(separatedBy: "=").last else { return }
        requestChars(forPage: Int(numberString) ?? 0)
    }

    var numberOfRows: Int { return charsList.count }

    func character(forIndex i: Int) -> Character? {
        guard i < charsList.count else { return nil }
        return charsList[i]
    }

    func didSelect(for index: Int) {
        guard index < charsList.count else { return }
        router.loadDetails(for: charsList[index])
    }
}
