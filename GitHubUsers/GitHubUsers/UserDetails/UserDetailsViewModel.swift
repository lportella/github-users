//
//  UserDetailsViewModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import NetworkKit

final class UserDetailsViewModel: UserDetailsUseCase, RequestUseCase {
    var onLoadingChanged: ((Bool) -> Void)?
    var onError: (([ApiError]) -> Void)?
}

extension UserDetailsViewModel {
    func fetchUserDetails() async {
        // MARK: To do
    }
}
