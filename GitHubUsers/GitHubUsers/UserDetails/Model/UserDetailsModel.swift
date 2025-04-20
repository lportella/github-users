//
//  UserDetailsModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

final class UserDetailsModel: BaseUser {
    let name: String
    let followers: Int
    let following: Int
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.followers = try container.decode(Int.self, forKey: .followers)
        self.following = try container.decode(Int.self, forKey: .following)
        try super.init(from: decoder)
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case followers
        case following
    }
    
    static func == (lhs: UserDetailsModel, rhs: UserDetailsModel) -> Bool {
        (lhs as BaseUser) == (rhs as BaseUser) &&
        lhs.name == rhs.name &&
        lhs.followers == rhs.followers &&
        lhs.following == rhs.following
    }
}
