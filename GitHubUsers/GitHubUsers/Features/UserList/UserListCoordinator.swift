//
//  UserListCoordinator.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit

final class UserListCoordinator: Coordinating {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let usersViewController = UserListFactory.make(navigationHandler: self)
        navigationController.setViewControllers([usersViewController], animated: true)
    }
}

extension UserListCoordinator: UserSearchNavigationHandling {
    func didSelectUser(_ username: String) {
        let userDetailsCoordinator = UserDetailsCoordinator(
            username: username,
            navigationController: navigationController
        )
        userDetailsCoordinator.start()
    }
}
