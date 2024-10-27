//
//  UIImageView+Extensions.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 19/2/24.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(from url: URL?) {
        image = UIImage(systemName: "photo.circle")

        guard let url else { return }

        DispatchQueue.global(qos: .background).async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }

    func rounded(cornerRadius: CGFloat? = nil) {
        if let cornerRadius {
            layer.cornerRadius = cornerRadius
        } else {
            layer.cornerRadius = frame.width / 2.0
        }
        
        clipsToBounds = true
        layoutIfNeeded()
    }
}
