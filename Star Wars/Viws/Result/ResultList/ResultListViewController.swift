//
//  ResultListViewController.swift
//  Star Wars
//
//  Created by Vinicius Silva on 08/11/21.
//

import UIKit

class ResultListViewController: UIViewController {
    var model: ResultListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = .blue
    }
}
