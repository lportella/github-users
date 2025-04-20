//
//  UserRepositoryModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

struct UserRepositoryModel: Decodable, Equatable {
    let name: String
    let repoUrl: String
    let description: String?
    let fork: Bool
    let language: String?
    let stargazersCount: Int

    private enum CodingKeys: String, CodingKey {
        case name
        case repoUrl = "svn_url"
        case description
        case fork
        case language
        case stargazersCount
    }
}
