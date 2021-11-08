//
//  ResultView.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 22/06/21.
//

import SwiftUI

struct ResultView: View {
    @StateObject var viewModel: ResultViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(alignment: .leading) {
                self.getGroupBy(queryType: .films)
                self.getGroupBy(queryType: .people)
                self.getGroupBy(queryType: .planets)
                self.getGroupBy(queryType: .species)
                self.getGroupBy(queryType: .vehicles)
                self.getGroupBy(queryType: .starships)
            }
        })
        .navigationTitle(self.viewModel.query)
        .animation(.default)
        .onAppear(perform: {
            self.viewModel.makeRequests()
        })
    }
    
    func getGroupBy(queryType: QueryType) -> some View {
        switch queryType {
        case .planets:
            return Group {
                Text(QueryType.planets.rawValue)
                    .padding(.leading, 10)
                ResultListView(viewModel: self.viewModel.planetsViewMode)
            }
            
        case .people:
            return Group {
                Text(QueryType.people.rawValue)
                    .padding(.leading, 10)
                ResultListView(viewModel: self.viewModel.peopleViewMode)
            }
            
        case .films:
            return Group {
                Text(QueryType.films.rawValue)
                    .padding(.leading, 10)
                ResultListView(viewModel: self.viewModel.filmsViewMode)
            }
            
        case .species:
            return Group {
                Text(QueryType.species.rawValue)
                    .padding(.leading, 10)
                ResultListView(viewModel: self.viewModel.speciesViewMode)
            }
            
        case .vehicles:
            return Group {
                Text(QueryType.vehicles.rawValue)
                    .padding(.leading, 10)
                ResultListView(viewModel: self.viewModel.vehiclesViewMode)
            }
            
        case .starships:
            return Group {
                Text(QueryType.starships.rawValue)
                    .padding(.leading, 10)
                ResultListView(viewModel: self.viewModel.starshipsViewMode)
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: ResultViewModel(query: "yoda"))
    }
}
