//
//  SOPAlertViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SOPAlertViewController: UIViewController {
    private lazy var containerView = UIView()
    private lazy var titleLabel = SOPTitleLabel(fontSize: 20, textAlignment: .center)
    private lazy var messageLabel = SOPBodyLabel(textAlignment: .center)
    private lazy var actionButton = SOPButton(title: "Ok", backgroundColor: .systemPink)

    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?

    private let padding: CGFloat = 20

    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)

        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle

        configureContainerView()
        configureTitleLabel()
        configureButton()
        configureMessageLabel()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }

    private func configureContainerView() {
        view.addSubview(containerView)

        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }

    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)

        titleLabel.text = alertTitle ?? "Error!"

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
        ])
    }

    private func configureButton() {
        containerView.addSubview(actionButton)

        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    @objc private func dismissVC() {
        dismiss(animated: true)
    }

    private func configureMessageLabel() {
        containerView.addSubview(messageLabel)

        messageLabel.text = message ?? "Something went wrong."
        messageLabel.numberOfLines = 4

        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -padding)
        ])
    }
}

#Preview {
    let alert = SOPAlertViewController(title: "User ID Required", message: "Please enter user id to search profile.", buttonTitle: "Ok")

    return alert
}
