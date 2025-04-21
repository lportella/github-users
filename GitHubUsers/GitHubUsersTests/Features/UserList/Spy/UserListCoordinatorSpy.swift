//
//  UserListCoordinatorSpy.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
@testable import GitHubUsers

final class UserListCoordinatorSpy: UserListNavigationHandling {
    enum Messages: Equatable {
        case didSelectUser(String)
    }
    
    var messages: [Messages] = []
    
    func didSelectUser(_ username: String) {
        messages.append(.didSelectUser(username))
    }
}
