//
//  User.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 5/2/24.
//

import Foundation

struct User {
    let userId: Int
    let displayName: String
    let creationDate: Int
    let lastAccessDate: Int
    let reputation: Int
    let location: String
    let website: String
    let profileLink: String
    let profileImage: String

    enum UserCodingKeys: String, CodingKey {
        case items
    }

    enum ItemCodingKeys: String, CodingKey {
        case userId = "user_id"
        case displayName = "display_name"
        case creationDate = "creation_date"
        case lastAccessDate = "last_access_date"
        case reputation
        case location
        case website = "website_url"
        case profileLink = "link"
        case profileImage = "profile_image"
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        var itemsContainer = try container.nestedUnkeyedContainer(forKey: .items)
        let firstItemContainer = try itemsContainer.nestedContainer(keyedBy: User.ItemCodingKeys.self)

        userId = try firstItemContainer.decode(Int.self, forKey: .userId)
        displayName = try firstItemContainer.decode(String.self, forKey: .displayName)
        creationDate = try firstItemContainer.decode(Int.self, forKey: .creationDate)
        lastAccessDate = try firstItemContainer.decode(Int.self, forKey: .lastAccessDate)
        reputation = try firstItemContainer.decode(Int.self, forKey: .reputation)
        location = try firstItemContainer.decode(String.self, forKey: .location)
        website = try firstItemContainer.decode(String.self, forKey: .website)
        profileLink = try firstItemContainer.decode(String.self, forKey: .profileLink)
        profileImage = try firstItemContainer.decode(String.self, forKey: .profileImage)
    }
}
