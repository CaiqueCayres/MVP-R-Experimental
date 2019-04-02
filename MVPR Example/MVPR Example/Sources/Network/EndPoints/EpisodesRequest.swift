//
//  RickAndMortyAPI.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation
import Alamofire

enum EpisodesRequest {

    case episodesList(Int)
    case episodes([Int])
    case episode(Int)
}

extension EpisodesRequest: NetworkRequest {

    var endpoint: String {
        switch self {

        case let .episodesList(page):
            return baseURL + "episode/?page=" + String(page)

        case let .episodes(eps):

            var episodes = eps.map { String($0) }
            let first = episodes.first ?? ""
            episodes.removeFirst()

            let listString: String = episodes.reduce(into: "") { $0 + "," + $1 }
            return baseURL + "episode/" + first + listString

        case let .episode(id):
            
            return baseURL + "episode/" + String(id)
        }
    }

    var parameters: Parameters? { return nil }

    var header: HTTPHeaders? { return nil }

    var method: HTTPMethod { return .get }
}
