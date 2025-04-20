//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import NetworkKit

final class UserListViewModel {
    private let networkService: Networking
        
    init(networkService: Networking) {
        self.networkService = networkService
    }
}

extension UserListViewModel: UserListUseCase {
    func fetchUserList() {
        // - To do
    }
}
