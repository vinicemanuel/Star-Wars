//
//  SearchView.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 20/06/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                HStack {
                    TextField("Searh here", text: self.$searchText)
                        .frame(height: 40, alignment: .center)
                    if self.searchText != "" {
                        Button(action: {
                            self.searchText = ""
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

                
                ForEach(0...5, id: \.self) { num in
                    NavigationLink(
                        destination: ResultView(),
                        label: {
                            HStack {
                                Text("hello \(num)")
                                Spacer()
                            }
                            .padding()
                        })
                    Divider()
                        .padding(.leading)
                }
            }
            .navigationTitle("Star Wars")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.light)
    }
}
