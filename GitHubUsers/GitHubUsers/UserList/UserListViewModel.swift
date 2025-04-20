//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import NetworkKit

final class UserListViewModel: UserListUseCase {
    private let networkService: Networking
    
    var onUserListLoaded: (([BaseUser]) -> Void)?
    var onLoadingChanged: (([BaseUser]) -> Void)?
    var onError: (([ApiError]) -> Void)?
        
    init(networkService: Networking) {
        self.networkService = networkService
    }
}

// MARK: - UserListUseCase
extension UserListViewModel  {
    func fetchUserList() {
        // - To do
    }
}
