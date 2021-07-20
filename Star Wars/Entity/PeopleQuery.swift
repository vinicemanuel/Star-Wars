//
//  PeopleQuery.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 20/07/21.
//

import Foundation

class People: Decodable {
    var name: String!
    var height: String!
}

class PeopleQuery: StarWarsQuery {
    var results: [People]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try values.decode([People].self, forKey: .results)
        try super.init(from: decoder)
    }
}
