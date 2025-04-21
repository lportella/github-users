//
//  UserDetailsCoordinatorSpy.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
@testable import GitHubUsers

final class UserDetailsCoordinatorSpy: UserDetailsNavigationHandling {
    enum Messages: Equatable {
        case didSelectRepository(URL)
    }
    
    var messages: [Messages] = []
    
    func didSelectRepository(with url: URL) {
        messages.append(.didSelectRepository(url))
    }
}
