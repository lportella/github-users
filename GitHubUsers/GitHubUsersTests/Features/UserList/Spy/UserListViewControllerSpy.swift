//
//  UserListViewControllerSpy.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
@testable import GitHubUsers

final class UserListViewControllerSpy: UserListDisplaying, ViewControllerDisplaying {
    enum Messages: Equatable {
        case handleLoading(Bool)
        case handleUserList([BaseUser])
        case didSelectUser(BaseUser)
    }
    
    var messages: [Messages] = []
    
    func handleLoading(_ isLoading: Bool) {
        messages.append(.handleLoading(isLoading))
    }
    
    func handleUserList(_ userList: [BaseUser]) {
        messages.append(.handleUserList(userList))
    }
    
    func didSelectUser(_ user: BaseUser) {
        messages.append(.didSelectUser(user))
    }
}
