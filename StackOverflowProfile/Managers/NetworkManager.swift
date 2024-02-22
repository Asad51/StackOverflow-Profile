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
            return Just(.failure(.invalidURL)).eraseToAnyPublisher()
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
                return .failure(.userNotFound)
            }
            .catch { Just(.failure(.unknown($0))) }
            .eraseToAnyPublisher()
    }

    func fetchBadges(for userId: Int) -> AnyPublisher<Result<[Badge], NetworkManagerError>, Never> {
        guard let url = URL(string: "https://api.stackexchange.com/2.3/users/\(userId)/badges?order=desc&sort=rank&site=stackoverflow") else {
            return Just(.failure(.invalidURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response -> Result<[Badge], NetworkManagerError> in
                print("response: \(response as? HTTPURLResponse)")
                print("Data: \(String(data: data, encoding: .utf8) ?? "")")

                guard let badgeDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let badgeDicts = badgeDictionary["items"] as? [[String: Any]],
                      let badgesJSON = try? JSONSerialization.data(withJSONObject: badgeDicts, options: .withoutEscapingSlashes)
                else {
                    return .failure(.decodingError)
                }
                print("JSON: \(String(data: badgesJSON, encoding: .utf8) ?? "")")

                if let badges = try? JSONDecoder().decode([Badge].self, from: data) {
                    return .success(badges)
                }

                return .failure(.userNotFound)
            }
            .catch { Just(.failure(.unknown($0))) }
            .eraseToAnyPublisher()
    }
}
