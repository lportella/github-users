//
//  UserDetailsViewModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import NetworkKit

final class UserDetailsViewModel: UserDetailsUseCase, RequestUseCase {
    private let networkService: Networking
    let username: String
    
    var onLoadingChanged: ((Bool) -> Void)?
    var onError: (([ApiError]) -> Void)?
    
    weak var navigationHandler: UserDetailsNavigationHandling?
    
    init(username: String, networkService: Networking) {
        self.username = username
        self.networkService = networkService
    }
}

extension UserDetailsViewModel {
    func fetchFullUserDetails() async {
        do {
            await MainActor.run { [weak self] in
                self?.onLoadingChanged?(true)
            }
            
            async let fetchUserDetails = fetchUserDetails()
            async let fetchUserRepos = fetchUserRepositories()
            
            let (userDetails, userRepos) = try await (fetchUserDetails, fetchUserRepos)
            
            await MainActor.run { [weak self] in
                // MARK: add use case for user details
                self?.onLoadingChanged?(false)
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchUserDetails() async throws -> UserDetailsModel {
        let userDetailsEndpoint = UserDetailsEndpoint(username: username)
        return try await networkService.request(userDetailsEndpoint)
    }
    
    func fetchUserRepositories() async throws -> [UserRepositoryModel] {
        let userReposEndpoint = UserRepositoriesEndpoint(username: username)
        return try await networkService.request(userReposEndpoint)
    }
    
    func didSelectRepository(_ repository: UserRepositoryModel) {
        navigationHandler?.didSelectRepository(with: repository.url)
    }
}
