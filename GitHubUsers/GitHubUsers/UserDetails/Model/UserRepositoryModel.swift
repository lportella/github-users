//
//  UserRepositoryModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

struct UserRepositoryModel: Decodable, Equatable {
    let name: String
    let url: String
    let description: String?
    let fork: Bool
    let language: String?
    let stargazersCount: Int
}
