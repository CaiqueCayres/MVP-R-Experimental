//
//  NetworkResponse.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 15/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {

    let info: InfosAPI?
    let results: T?
}

struct InfosAPI: Codable {

    let count: Int?
    let page: Int?
    let next: String?
    let prev: String?
}
