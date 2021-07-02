//
//  ResultView.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 22/06/21.
//

import SwiftUI

struct ResultView: View {
    var searchQuery: String
    
    var body: some View {
        Text(self.searchQuery)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(searchQuery: "yoda")
    }
}