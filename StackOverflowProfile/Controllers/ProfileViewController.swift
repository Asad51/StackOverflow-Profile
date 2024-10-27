//
//  ProfileViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private lazy var creationDateLabel = SOPBodyLabel()
    private lazy var lastAccessedLabel = SOPBodyLabel()
    private lazy var reputationLabel = SOPBodyLabel()
    private lazy var locationLabel = SOPBodyLabel()

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = user.displayName
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false

        setupUI()
    }

    private func setupUI() {
        // Setup profile Image
        view.addSubview(profileImageView)

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.setImage(from: URL(string: user.profileImage)) 
        profileImageView.rounded(cornerRadius: 10)

        NSLayoutConstraint.activate([
            profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            profileImageView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
        ])

        // Setup account creation date
        view.addSubview(creationDateLabel)

        creationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        creationDateLabel.setTextWithImage(systemImageName: "person.text.rectangle", text: "Member since \(Date(timeIntervalSince1970: TimeInterval(user.creationDate)).formatted("MMMM, yyyy"))")

        NSLayoutConstraint.activate([
            creationDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            creationDateLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10)
        ])

        // Setup last access date
        view.addSubview(lastAccessedLabel)

        lastAccessedLabel.translatesAutoresizingMaskIntoConstraints = false
        lastAccessedLabel.setTextWithImage(systemImageName: "clock", text: "Last seen on \(Date(timeIntervalSince1970:TimeInterval(user.lastAccessDate)).formatted("MMMM d, yyyy"))")

        NSLayoutConstraint.activate([
            lastAccessedLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            lastAccessedLabel.topAnchor.constraint(equalTo: creationDateLabel.bottomAnchor, constant: 10)
        ])

        // Setup location
        view.addSubview(locationLabel)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.setTextWithImage(systemImageName: "location", text: "\(user.location)")

        NSLayoutConstraint.activate([
            locationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            locationLabel.topAnchor.constraint(equalTo: lastAccessedLabel.bottomAnchor, constant: 10)
            ])
    }
}

#Preview {
    let profileVC = ProfileViewController()
    profileVC.user = User(
        userId: 7646289,
        displayName: "Asad",
        creationDate: Int(Date.now.timeIntervalSince1970) - 100000000,
        lastAccessDate: Int(Date.now.timeIntervalSince1970),
        reputation: 233,
        location: "Dhaka",
        website: "",
        profileLink: "",
        profileImage: "https://i.stack.imgur.com/iitlv.jpg?s=256&g=1"
    )
    return profileVC
}
