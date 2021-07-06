//
//  SearchView.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 20/06/21.
//

import SwiftUI

struct SearchView: View {
    @State var showDetail: Bool = false
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(
                    destination: ResultView(searchQuery: self.viewModel.searchText),
                    isActive: self.$showDetail,
                    label: {})
                
                HStack {
                    TextField("Searh here", text: self.$viewModel.searchText, onCommit: {
                        self.viewModel.saveSearch(query: self.viewModel.searchText)
                        print(self.viewModel.searchText)
                        self.showDetail = true
                        UIApplication.shared.endEditing()
                    })
                    .frame(height: 40, alignment: .center)
                    .onTapGesture {
                        self.viewModel.searchText = ""
                    }
                    
                    if self.viewModel.searchText != "" {
                        Button(action: {
                            self.viewModel.searchText = ""
                            UIApplication.shared.endEditing()
                        }, label: {
                            Text("Cancel")
                        })
                    } else {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray2))
                    }
                }
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .animation(.default)
                
                ForEach(self.viewModel.searchs) { search in
                    NavigationLink(
                        destination: ResultView(searchQuery: search.query),
                        label: {
                            SearchCell(textLabel: search.query)
                        })
                    Divider()
                        .padding(.leading)
                }
            }
            .navigationTitle("Star Wars")
        }
        .onAppear(perform: {
            self.viewModel.searchText = ""
        })
    }
}

struct SearchCell: View {
    var textLabel: String
    var body: some View {
        HStack {
            Text(textLabel)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.light)
    }
}
