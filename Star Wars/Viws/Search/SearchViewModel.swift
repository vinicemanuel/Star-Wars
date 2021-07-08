//
//  SearchViewModel.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 02/07/21.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searches = [SearchObject]()
    @Published var searchText: String {
        didSet {
            self.updateSearches(filter: self.searchText)
        }
    }
    
    init() {
        self.searchText = ""
    }
    
    private func updateSearches(filter: String = "") {
        self.searches = DatabaseUtil.shared.loadAllSearches(search: filter)
    }
    
    func saveSearch(query: String) {
        DatabaseUtil.shared.save(search: SearchObject(query: query, timeStamp: Date()))
    }
}
