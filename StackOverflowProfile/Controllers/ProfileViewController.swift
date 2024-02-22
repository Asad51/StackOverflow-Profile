//
//  ProfileViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = user.displayName
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false

        setupUI()
    }

    private func setupUI() { 
        view.addSubview(profileImageView)

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.setImage(from: URL(string: user.profileImage)) 
        profileImageView.rounded()

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 20), 
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

#Preview {
    let profileVC = ProfileViewController()
    profileVC.user = User(
        userId: 7646289,
        displayName: "Asad",
        creationDate: Int(Date.now.timeIntervalSince1970),
        lastAccessDate: Int(Date.now.timeIntervalSince1970),
        reputation: 233,
        location: "Dhaka",
        website: "",
        profileLink: "",
        profileImage: "https://i.stack.imgur.com/iitlv.jpg?s=256&g=1"
    )
    return profileVC
}
