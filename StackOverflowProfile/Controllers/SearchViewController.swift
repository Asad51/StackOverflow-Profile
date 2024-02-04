//
//  SearchViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var logoImageView = UIImageView()
    private lazy var userIdTextField = SOPTextField()
    private lazy var searchButton = SOPButton(title: "Search", backgroundColor: .systemTeal)

    private var isUserIdEntered: Bool {
        return userIdTextField.text?.isEmpty == false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        configureLogo()
        configureTextfield()
        configureSearchButton()
        createDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Setup UI

extension SearchViewController {
    private func configureLogo() {
        view.addSubview(logoImageView)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = .stackOverflowIcon

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }

    private func configureTextfield() {
        view.addSubview(userIdTextField)
        userIdTextField.delegate = self

        NSLayoutConstraint.activate([
            userIdTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userIdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userIdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userIdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func configureSearchButton() {
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(openProfileVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func openProfileVC() {
        guard isUserIdEntered else {
            presentSOPAlert(title: "Empty user ID", message: "Please enter an user id to search.", buttonTitle: "Ok")
            return
        }

        let profileVC = ProfileViewController()
        profileVC.userId = userIdTextField.text
        profileVC.title = userIdTextField.text

        navigationController?.pushViewController(profileVC, animated: true)
    }

    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - UITextFieldDelegate conformation

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_: UITextField) -> Bool {
        openProfileVC()

        return true
    }
}

#Preview {
    let searchVC = UINavigationController(rootViewController: SearchViewController())
    searchVC.title = "Search"

    return searchVC
}
