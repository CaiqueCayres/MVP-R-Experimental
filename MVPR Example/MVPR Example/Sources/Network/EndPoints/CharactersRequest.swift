//
//  CharactersRequest.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 14/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation
import Alamofire

enum CharacterRequest {

    case charactersList(Int)
    case character(Int)
    case characters([Int])
}

extension CharacterRequest: NetworkRequest {

    var endpoint: String {
        switch self {
        case let .charactersList(page):
            return baseURL + "character/?page=" + String(page)
        case let .character(id):
            return baseURL + "\(id)"
        case let .characters(ids):
            return baseURL + "\(ids)"
        }
    }

    var parameters: Parameters? { return nil }

    var header: HTTPHeaders? { return nil }

    var method: HTTPMethod { return .get }

}
