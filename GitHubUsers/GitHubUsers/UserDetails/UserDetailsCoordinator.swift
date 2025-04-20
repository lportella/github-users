//
//  UserDetailsCoordinator.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import UIKit

final class UserDetailsCoordinator: Coordinating {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userDetailsViewController = UserDetailsFactory.make()
        navigationController.pushViewController(
            userDetailsViewController,
            animated: true
        )
    }
}
