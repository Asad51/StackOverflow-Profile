//
//  Badge.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 19/2/24.
//

import Foundation

struct Badge: Decodable {
    let id: Int
    let name: String
    let rank: BadgeRank
    let awardCount: Int
    let link: String

    enum BadgeCodingKeys: String, CodingKey {
        case id = "badge_id"
        case name
        case rank
        case awardCount = "award_count"
        case link
    }
}

extension Badge {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BadgeCodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        rank = try container.decode(BadgeRank.self, forKey: .rank)
        awardCount = try container.decode(Int.self, forKey: .awardCount)
        link = try container.decode(String.self, forKey: .link)
    }
}
