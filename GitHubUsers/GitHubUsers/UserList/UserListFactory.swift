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
    typealias OnUserSelect = ((BaseUser) -> Void)
    
    static func make(_ onUserSelect: @escaping OnUserSelect) -> UIViewController {
        let resolver = DependencyContainer.shared.container
        let userListViewModel = UserListViewModel(networkService: resolver.resolve(Networking.self))
        let viewController = UserListViewController(viewModel: userListViewModel)
        
        userListViewModel.onLoadingChanged = viewController.handleLoading(_:)
        userListViewModel.onUserListLoaded = viewController.handleUserList(_:)
        userListViewModel.onUserSelected = onUserSelect
        
        return viewController
    }
}
