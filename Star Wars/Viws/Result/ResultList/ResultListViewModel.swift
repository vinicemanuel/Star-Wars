//
//  ResultListViewModel.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 20/07/21.
//

import Foundation
import Combine

class ResultListViewModel: ObservableObject {
    private let baseURL = "https://swapi.dev/api/"
    private var subscriptions = Set<AnyCancellable>()
    private let query: String
    private var starWarsQuery: StarWarsQuery?
    
    @Published var elements: [String] = [String]()
    let type: QueryType
    
    init(type: QueryType, query: String) {
        self.type = type
        self.query = query
    }
    
    func makeRequest(page: Int = 1) {
        asyncPromiseWith(url: "\(baseURL)\(type.rawValue)/?search=\(self.query)&page=\(page)")
            .receive(on: DispatchQueue.main)
            .tryMap({ data -> StarWarsQuery in
                switch self.type {
                case .people:
                    return try JSONDecoder().decode(PeopleQuery.self, from: data)
                default:
                    throw NSError(domain: "Invalid type", code: 0, userInfo: nil)
                }
            })
            .sink(receiveCompletion: { print($0) }, receiveValue: { value in
                self.starWarsQuery = value

                var nameArray = [String]()
                
                switch self.type {
                case .people:
                    let peopleQuery = value as! PeopleQuery
                    peopleQuery.results.forEach { (person) in
                        nameArray.append(person.name)
                    }
                default:
                    break
                }
                
                self.elements = nameArray
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
