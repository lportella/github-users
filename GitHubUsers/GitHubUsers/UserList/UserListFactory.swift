//
//  UserListFactory.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit
import Swinject
import NetworkKit

final class UserListFactory {
    static func make(navigationHandler: UserSearchNavigationHandling) -> UIViewController {
        let resolver = DependencyContainer.shared.container
        let userListViewModel = UserListViewModel(networkService: resolver.resolve(Networking.self))
        let viewController = UserListViewController(viewModel: userListViewModel)
        
        userListViewModel.onLoadingChanged = viewController.handleLoading(_:)
        userListViewModel.onUserListLoaded = viewController.handleUserList(_:)
        userListViewModel.navigationHandler = navigationHandler
        
        return viewController
    }
}
