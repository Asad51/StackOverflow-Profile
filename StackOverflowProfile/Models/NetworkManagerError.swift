//
//  NetworkManagerError.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 18/2/24.
//

import Foundation

enum NetworkManagerError: Error {
    case invalidURL
    case userNotFound
    case decodingError
    case unknown(Error)

    var description: String {
        switch self {
            case .invalidURL:
                "The url is invalid."
            case .userNotFound:
                "User not found."
            case .decodingError:
                "Can't decode the data."
            case let .unknown(error):
                error.localizedDescription
        }
    }
}
