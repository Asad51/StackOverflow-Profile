//
//  SOPBodyLabel.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SOPBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)

        self.textAlignment = textAlignment

        configure()
    }

    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setTextWithImage(imageName: String, text: String) {
        setTextWithImage(UIImage(named: imageName), text: text)
    }

    func setTextWithImage(systemImageName: String, text: String) {
        setTextWithImage(UIImage(systemName: systemImageName), text: text)
    }

    private func setTextWithImage(_ image: UIImage?, text: String) {
        let textAttachment = NSTextAttachment()
        textAttachment.image = image

        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(attachment: textAttachment))
        attributedText.append(NSAttributedString(string: text))

        self.attributedText = attributedText
    }
}

#Preview {
    let label = SOPBodyLabel(textAlignment: .left)
    label.numberOfLines = 0
    label.setTextWithImage(systemImageName: "clock", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

    return label
}
