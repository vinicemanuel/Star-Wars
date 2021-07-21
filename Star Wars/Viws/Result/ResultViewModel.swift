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
    let planetsViewMode: ResultListViewModel
    let peopleViewMode: ResultListViewModel
    let filmsViewMode: ResultListViewModel
    let speciesViewMode: ResultListViewModel
    let vehiclesViewMode: ResultListViewModel
    let starshipsViewMode: ResultListViewModel
    
    private var subscriptions = Set<AnyCancellable>()
    
    let query: String
    
    init(query: String) {
        self.query = query
        self.planetsViewMode = ResultListViewModel(type: .planets, query: query)
        self.peopleViewMode = ResultListViewModel(type: .people, query: query)
        self.filmsViewMode = ResultListViewModel(type: .films, query: query)
        self.speciesViewMode = ResultListViewModel(type: .species, query: query)
        self.vehiclesViewMode = ResultListViewModel(type: .vehicles, query: query)
        self.starshipsViewMode = ResultListViewModel(type: .starships, query: query)
        
        self.planetsViewMode.$elements
            .merge(with: self.peopleViewMode.$elements)
            .merge(with: self.filmsViewMode.$elements)
            .merge(with: self.speciesViewMode.$elements)
            .merge(with: self.vehiclesViewMode.$elements)
            .merge(with: self.starshipsViewMode.$elements)
            .receive(on: DispatchQueue.main)
            .sink { (value) in
            print(value)
            self.objectWillChange.send()
        }
        .store(in: &subscriptions)
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
