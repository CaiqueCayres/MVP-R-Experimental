//
//  NetworkRequest.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkRequest {

    var baseURL: String { get }
    var endpoint: String { get }
    var parameters: Parameters? { get }
    var header: HTTPHeaders? { get }
    var enconding: ParameterEncoding { get }
    var method: HTTPMethod { get }
}

extension NetworkRequest {

    var baseURL: String { return "https://rickandmortyapi.com/api/" }

    var enconding: ParameterEncoding { return JSONEncoding.default }
}
