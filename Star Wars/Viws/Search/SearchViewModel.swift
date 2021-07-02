//
//  SearchViewModel.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 02/07/21.
//

import Foundation
import Combine

var array = [SearchObject(query: "query 1"), SearchObject(query: "query 2"), SearchObject(query: "query 3"), SearchObject(query: "query 4"), SearchObject(query: "query 5")]

class SearchViewModel: ObservableObject {
    @Published var searchs = [SearchObject]()
    @Published var searchText: String {
        didSet {
            self.getSearchs(filter: self.searchText)
        }
    }
    
    init() {
        self.searchText = ""
    }
    
    private func getSearchs(filter: String = "") {
        if filter.isEmpty {
            self.searchs = array
        } else {
            self.searchs = array.filter({$0.query.lowercased().contains(filter.lowercased())})
        }
    }
    
    func saveSearch(query: String) {
        array.append(SearchObject(query: query))
    }
}
