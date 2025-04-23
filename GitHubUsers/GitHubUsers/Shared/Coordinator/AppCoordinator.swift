//
//  AppCoordinator.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit

final class AppCoordinator: Coordinating {
    var navigationController: UINavigationController
    
    let window: UIWindow
    
    var childViewControllers = [Coordinating]()
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let searchCoordinator = UserListCoordinator(navigationController)
        searchCoordinator.start()
        childViewControllers = [searchCoordinator]
        window.rootViewController = searchCoordinator.navigationController
    }
}
