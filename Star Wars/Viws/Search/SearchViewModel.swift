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
    @Published var searchText: String = ""
    
    var subscription: AnyCancellable? = nil
    
    init() {
        self.subscription = self.$searchText.sink { (value) in
            print(value)
            self.searches = DatabaseUtil.shared.loadAllSearches(search: value)
        }
    }
    
    func saveSearch(query: String) {
        DatabaseUtil.shared.save(search: SearchObject(query: query, timeStamp: Date()))
    }
}
