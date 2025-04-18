//
//  SearchCoordinator.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit

final class SearchCoordinator: Coordinating {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let usersViewController = SearchFactory.make()
        navigationController.setViewControllers([usersViewController], animated: true)
    }
}
