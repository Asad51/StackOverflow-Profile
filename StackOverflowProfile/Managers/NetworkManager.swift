//
//  NetworkManager.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 6/2/24.
//

import Combine
import Foundation

class NetworkManager {
    public static let shared = NetworkManager()

    private init() {}

    func fetchUser(userId: Int) -> AnyPublisher<Result<User, NetworkManagerError>, Never> {
        guard let url = URL(string: "https://api.stackexchange.com/2.3/users/\(userId)?order=desc&sort=reputation&site=stackoverflow") else {
            return Just(.failure(NetworkManagerError.invalidURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response -> Result<User, NetworkManagerError> in
                print("response: \(response as? HTTPURLResponse)")
                print("Data: \(String(data: data, encoding: .utf8) ?? "")")

                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    return .success(user)
                }

                // The server gives success response even if user is not found
                // for now, keep it simple returning default error
                return .failure(NetworkManagerError.userNotFound)
            }
            .catch { Just(.failure(NetworkManagerError.unknown($0))) }
            .eraseToAnyPublisher()
    }
}
