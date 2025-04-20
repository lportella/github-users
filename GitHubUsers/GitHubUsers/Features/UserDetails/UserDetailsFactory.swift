//
//  UserDetailsFactory.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import UIKit
import NetworkKit

final class UserDetailsFactory {
    static func make(
        with username: String,
        navigationHandler: UserDetailsNavigationHandling
    ) -> UIViewController {
        let resolver = DependencyContainer.shared.container
        let viewModel = UserDetailsViewModel(
            username: username,
            networkService: resolver.resolve(Networking.self)
        )
        let viewController = UserDetailsViewController(viewModel: viewModel)
        
        viewModel.onLoadingChanged = viewController.handleLoading(_:)
        viewModel.onFullUserDetailsLoaded = viewController.handleUserDetails(_:_:)
        viewModel.navigationHandler = navigationHandler
        
        return viewController
    }
}
