//
//  ProfileViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class ProfileViewController: UIViewController {
    var userId: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.tabBar.isHidden = true
    }
}

#Preview {
    let profileVC = ProfileViewController()
    profileVC.userId = "7646289"
    profileVC.title = "7646289"

    return profileVC
}
