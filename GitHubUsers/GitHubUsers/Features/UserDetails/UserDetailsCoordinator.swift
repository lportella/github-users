//
//  UserDetailsCoordinator.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import DesignSystem
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
        let repoWebView = WebViewController(url: url)
        navigationController.pushViewController(repoWebView, animated: true)
    }
    
    func displayFeedbackSystem(_ feedbackItem: FeedbackViewItem) {
        typealias FeedbackViewType = (FeedbackViewDisplaying & UIViewController)
        let feedbackViewController = FeedbackViewController() as FeedbackViewType
        feedbackViewController.configure(with: feedbackItem)
        feedbackViewController.modalPresentationStyle = .fullScreen
        navigationController.popViewController(animated: false)
        navigationController.present(feedbackViewController, animated: true)
    }
}

