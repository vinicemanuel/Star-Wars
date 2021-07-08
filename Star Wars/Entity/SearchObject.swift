//
//  SearchObject.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 02/07/21.
//

import Foundation
import Combine

class SearchObject: Identifiable {
    let query: String
    let timeStamp: Date
    
    init(query: String, timeStamp: Date) {
        self.query = query
        self.timeStamp = timeStamp
    }
}
