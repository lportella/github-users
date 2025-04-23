//
//  UserDetailsDisplaying.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

protocol UserDetailsDisplaying {
    func handleUserDetails(
        _ userDetails: UserDetailsModel,
        _ userRepos: [UserRepositoryModel]
    )
    func didSelectRepository(_ repository: UserRepositoryModel)
}
