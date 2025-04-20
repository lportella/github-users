//
//  UserDetailsCoordinator.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import UIKit

final class UserDetailsCoordinator: Coordinating {
    var navigationController: UINavigationController
    var username: String
    
    init(username: String, navigationController: UINavigationController) {
        self.username = username
        self.navigationController = navigationController
    }
    
    func start() {
        let userDetailsViewController = UserDetailsFactory.make(
            with: username,
            navigationHandler: self
        )
        navigationController.pushViewController(
            userDetailsViewController,
            animated: true
        )
    }
}

extension UserDetailsCoordinator: UserDetailsNavigationHandling {
    func didSelectRepository(with url: URL) {
        // MARK: display webview
    }
}
