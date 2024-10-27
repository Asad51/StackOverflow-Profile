//
//  Date+Extensions.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 27/10/24.
//

import Foundation

extension Date {
    func formatted(_ dateFormat: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
