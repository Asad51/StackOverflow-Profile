//
//  SearchViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import Combine
import UIKit

class SearchViewController: UIViewController {
    private lazy var logoImageView = UIImageView()
    private lazy var userIdTextField = SOPTextField()
    private lazy var searchButton = SOPButton(title: "Search", backgroundColor: .systemTeal)

    private var loader: UIAlertController!
    private let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))

    private var subscriptions = Set<AnyCancellable>()
    private var user: User?
    private var networkError: NetworkManagerError?

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
        createLoader()
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
        userIdTextField.text = "7646289"

        NSLayoutConstraint.activate([
            userIdTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userIdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userIdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userIdTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func configureSearchButton() {
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(searchUser), for: .touchUpInside)

        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func searchUser() {
        guard isUserIdEntered, let userId = Int(userIdTextField.text ?? "Empty") else {
            presentSOPAlert(title: "Empty or invalid user ID", message: "Please enter a valid user id to search.", buttonTitle: "Ok")
            return
        }

        startLoader()

        NetworkManager.shared.fetchUser(userId: userId)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.stopLoader()

                self?.handleSearchResult()
            } receiveValue: { [weak self] result in
                guard let self else { return }

                switch result {
                    case let .success(user):
                        self.user = user
                        self.networkError = nil
                    case let .failure(error):
                        self.user = nil
                        self.networkError = error
                }
            }
            .store(in: &subscriptions)
    }

    private func handleSearchResult() {
        if let networkError {
            let alert = UIAlertController(title: "Something went wrong", message: networkError.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))

            present(alert, animated: true)
            return
        }

        if let user {
            let profileVC = ProfileViewController()
            profileVC.user = user
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }

    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Setup loader

extension SearchViewController {
    private func createLoader() {
        loader = UIAlertController(title: "", message: "Searching...", preferredStyle: .alert)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loader.view.addSubview(loadingIndicator)
    }

    private func startLoader() {
        present(loader, animated: true)
        loadingIndicator.startAnimating()
    }

    private func stopLoader() {
        loadingIndicator.stopAnimating()
        loader.dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate conformation

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_: UITextField) -> Bool {
        searchUser()
        return true
    }
}

#Preview {
    let searchVC = UINavigationController(rootViewController: SearchViewController())
    searchVC.title = "Search"

    return searchVC
}
