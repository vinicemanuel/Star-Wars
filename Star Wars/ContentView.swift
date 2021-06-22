//
//  ContentView.swift
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
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)

                
                ForEach(0...5, id: \.self) { num in
                    HStack {
                        Text("hello \(num)")
                        Spacer()
                    }
                    .padding()
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
