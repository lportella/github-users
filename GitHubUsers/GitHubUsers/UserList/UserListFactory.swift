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
    static func make() -> UIViewController {
        let resolver = DependencyContainer.shared.container
        let viewModel = UserListViewModel(networkService: resolver.resolve(Networking.self))
        return UserListViewController()
    }
}
