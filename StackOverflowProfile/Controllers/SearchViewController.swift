//
//  SearchViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
    }
}

#Preview {
    let searchVC = UINavigationController(rootViewController: SearchViewController())
    searchVC.title = "Search"

    return searchVC
}
