//
//  UserListCoordinatorSpy.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
@testable import DesignSystem
@testable import GitHubUsers

final class UserListCoordinatorSpy: UserListNavigationHandling {
    enum Messages: Equatable {
        case didSelectUser(String)
        case displayFeedbackSystem
    }
    
    var messages: [Messages] = []
    
    func didSelectUser(_ username: String) {
        messages.append(.didSelectUser(username))
    }
    
    func displayFeedbackSystem(_ feedbackItem: FeedbackViewItem) {
        messages.append(.displayFeedbackSystem)
    }
}
