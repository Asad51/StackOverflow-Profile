//
//  SOPButton.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SOPButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)

        configure()
    }

    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    SOPButton(title: "Profile", backgroundColor: .blue)
}
