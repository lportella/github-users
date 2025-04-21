i//
//  UserDetailsViewControllerSpy.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

@testable import GitHubUsers

final class UserDetailsViewControllerSpy: UserDetailsDisplaying, ViewControllerDisplaying {
    enum Messages: Equatable {
        case handleLoading(Bool)
        case handleUserDetails(UserDetailsModel, [UserRepositoryModel])
        case didSelectRepository(UserRepositoryModel)
    }
    
    var messages: [Messages] = []
    
    func handleLoading(_ isLoading: Bool) {
        messages.append(.handleLoading(isLoading))
    }
    
    func handleUserDetails(_ userDetails: UserDetailsModel, _ userRepos: [UserRepositoryModel]) {
        messages.append(.handleUserDetails(userDetails, userRepos))
    }
    
    func didSelectRepository(_ repository: UserRepositoryModel) {
        messages.append(.didSelectRepository(repository))
    }
}
