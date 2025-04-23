//
//  UserDetailsCoordinatorSpy.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
@testable import DesignSystem
@testable import GitHubUsers

final class UserDetailsCoordinatorSpy: UserDetailsNavigationHandling {
    enum Messages: Equatable {
        case didSelectRepository(URL)
        case displayFeedbackSystem
    }
    
    var messages: [Messages] = []
    
    func didSelectRepository(with url: URL) {
        messages.append(.didSelectRepository(url))
    }
    
    func displayFeedbackSystem(_ feedbackItem: FeedbackViewItem) {
        messages.append(.displayFeedbackSystem)
    }
}
