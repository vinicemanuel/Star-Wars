//
//  ResultViewModel.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 09/07/21.
//

import Foundation
import Combine

enum QueryType: String {
    case planets = "planets"
    case people = "people"
    case films = "films"
    case species = "species"
    case vehicles = "vehicles"
    case starships = "starships"
}

class ResultViewModel: ObservableObject {
    @Published var planetsViewMode: ResultListViewModel
    @Published var peopleViewMode: ResultListViewModel
    @Published var filmsViewMode: ResultListViewModel
    @Published var speciesViewMode: ResultListViewModel
    @Published var vehiclesViewMode: ResultListViewModel
    @Published var starshipsViewMode: ResultListViewModel
    
    let query: String
    
    init(query: String) {
        self.query = query
        self.planetsViewMode = ResultListViewModel(type: .planets, query: query)
        self.peopleViewMode = ResultListViewModel(type: .people, query: query)
        self.filmsViewMode = ResultListViewModel(type: .films, query: query)
        self.speciesViewMode = ResultListViewModel(type: .species, query: query)
        self.vehiclesViewMode = ResultListViewModel(type: .vehicles, query: query)
        self.starshipsViewMode = ResultListViewModel(type: .starships, query: query)
    }
    
    func makeRequests() {
        self.planetsViewMode.makeRequest()
        self.peopleViewMode.makeRequest()
        self.filmsViewMode.makeRequest()
        self.speciesViewMode.makeRequest()
        self.vehiclesViewMode.makeRequest()
        self.starshipsViewMode.makeRequest()
    }
}
