//
//  UserDetailsFactory.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import UIKit

final class UserDetailsFactory {
    static func make(with username: String) -> UIViewController {
        let viewModel = UserDetailsViewModel(username: username)
        let viewController = UserDetailsViewController()
        return viewController
    }
}
