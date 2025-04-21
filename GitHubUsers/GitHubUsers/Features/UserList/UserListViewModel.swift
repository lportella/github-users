//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import NetworkKit

final class UserListViewModel: UserListUseCase, RequestUseCase {
    private let networkService: Networking
    
    var onUserListLoaded: (([BaseUser]) -> Void)?
    var onLoadingChanged: ((_ isLoading: Bool) -> Void)?
    var onError: (([ApiError]) -> Void)?
    
    weak var navigationHandler: UserListNavigationHandling?
    
    init(networkService: Networking) {
        self.networkService = networkService
    }
}

// MARK: - UserListUseCase
extension UserListViewModel  {
    func fetchUserList() async {
        do {
            await MainActor.run { [weak self] in
                self?.onLoadingChanged?(true)
            }
            
            let response: [BaseUser] = try await networkService.request(UserListEndpoint())
            
            await MainActor.run { [weak self] in
                self?.onUserListLoaded?(response)
                self?.onLoadingChanged?(false)
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    func didSelectUser(_ user: BaseUser) {
        navigationHandler?.didSelectUser(user.login)
    }
}
