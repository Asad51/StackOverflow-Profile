//
//  UIViewController+Extensions.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

extension UIViewController {
    func presentSOPAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = SOPAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            
            self.present(alert, animated: true)
        }
    }
}
