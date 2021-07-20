//
//  StarWarsQuery.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 20/07/21.
//

import Foundation

class StarWarsQuery: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
}
