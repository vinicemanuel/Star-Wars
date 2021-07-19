//
//  ResultViewModel.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 09/07/21.
//

import Foundation
import Combine

fileprivate enum QueryType: String {
    case planets = "planets"
    case people = "people"
    case films = "films"
    case species = "species"
    case vehicles = "vehicles"
    case starships = "starships"
}

class ResultViewModel: ObservableObject {
    @Published var planets: [String] = [String]()
    @Published var people: [String] = [String]()
    @Published var films: [String] = [String]()
    @Published var species: [String] = [String]()
    @Published var vehicles: [String] = [String]()
    @Published var starships: [String] = [String]()
    
    private let baseURL = "https://swapi.dev/api"
    private var subscriptions = Set<AnyCancellable>()
    
    let query: String
    
    init(query: String) {
        self.query = query
    }
}
