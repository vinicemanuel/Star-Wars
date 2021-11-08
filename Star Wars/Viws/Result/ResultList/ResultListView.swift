//
//  ResultListView.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 20/07/21.
//

import SwiftUI

struct ResultListView: UIViewControllerRepresentable {
    @StateObject var viewModel: ResultListViewModel
    
    func makeUIViewController(context: Context) -> some ResultListViewController {
        let viewController = ResultListViewController()
        viewController.model = self.viewModel
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(viewModel: ResultListViewModel(type: .people, query: "yoda"))
    }
}
