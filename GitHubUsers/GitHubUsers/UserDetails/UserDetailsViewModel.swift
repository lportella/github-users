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
    
    let username: String
    
    init(username: String) {
        self.username = username
    }
}

extension UserDetailsViewModel {
    func fetchUserDetails() async {
        do {
            await MainActor.run { [weak self] in
                self?.onLoadingChanged?(true)
            }
            
            // MARK: add async request for user details and repos
            
            await MainActor.run { [weak self] in
                // MARK: add use case for user details
                self?.onLoadingChanged?(false)
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
