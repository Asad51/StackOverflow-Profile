//
//  SOPTitleLabel.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SOPTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(fontSize: CGFloat, textAlignment: NSTextAlignment) {
        super.init(frame: .zero)

        self.textAlignment = textAlignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)

        configure()
    }

    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    let label = SOPTitleLabel(fontSize: 24, textAlignment: .left)
    label.text = "Asad"

    return label
}
