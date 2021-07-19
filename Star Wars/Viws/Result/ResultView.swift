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
        Text(self.viewModel.query)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: ResultViewModel(query: "yoda"))
    }
}
