//
//  Character.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 14/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation


class Character: Codable {

    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: Origin?
    var location: Location?
    var episode: [String]?
    var image: String?
}

extension Character {

    struct Origin: Codable {
        var name: String?
        var url: String?
    }

    struct Location: Codable {
        var name: String?
        var url: String?
    }
}
