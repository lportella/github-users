//
//  UserDetailsUseCase.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

protocol UserDetailsUseCase {
    func fetchFullUserDetails() async throws
    func fetchUserDetails() async throws -> UserDetailsModel
    func fetchUserRepositories() async throws -> [UserRepositoryModel]
}
