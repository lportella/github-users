//
//  BaseUser.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//

class BaseUser: Decodable, Equatable {
    let id: Int
    let login: String
    let avatarUrl: String
    
    init(id: Int, login: String, avatarUrl: String) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        login = try container.decode(String.self, forKey: .login)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
    }

    static func == (lhs: BaseUser, rhs: BaseUser) -> Bool {
        lhs.id == rhs.id &&
        lhs.login == rhs.login &&
        lhs.avatarUrl == rhs.avatarUrl
    }
}
