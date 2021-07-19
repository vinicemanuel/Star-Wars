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
    @Published var planets: [String] = [String]()
    @Published var people: [String] = [String]()
    @Published var films: [String] = [String]()
    @Published var species: [String] = [String]()
    @Published var vehicles: [String] = [String]()
    @Published var starships: [String] = [String]()
    
    private let baseURL = "https://swapi.dev/api/"
    private var subscriptions = Set<AnyCancellable>()
    
    let query: String
    
    init(query: String) {
        self.query = query
    }
    
    func makeRequests() {
        makeRequest(for: .planets)
        makeRequest(for: .people)
        makeRequest(for: .films)
        makeRequest(for: .species)
        makeRequest(for: .vehicles)
        makeRequest(for: .starships)
    }
    
    private func makeRequest(for type: QueryType) {
        asyncPromiseWith(url: "\(baseURL)\(type.rawValue)/?search=\(self.query.lowercased())")
            .sink(receiveCompletion: { print($0) }, receiveValue: {
                    print($0)
            })
            .store(in: &subscriptions)
    }
    
    private func asyncPromiseWith(url urlString: String) -> Future<Data, Error> {
        return Future<Data, Error>() { promise in
            if let url = URL(string: urlString) {
                URLSession.shared.dataTaskPublisher(for: url)
                    .sink(receiveCompletion: { _ in }, receiveValue: {(data, response) in
                        let response = response as! HTTPURLResponse
                        
                        if response.statusCode != 200 {
                            promise(.failure(NSError(domain: "invalid request", code: response.statusCode, userInfo: nil)))
                        }
                        promise(.success(data))
                    })
                    .store(in: &self.subscriptions)
                
            } else {
                promise(.failure(NSError(domain: "invalid URL", code: 0, userInfo: nil)))
            }
        }
    }
}
