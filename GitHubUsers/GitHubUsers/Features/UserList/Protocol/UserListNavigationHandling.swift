//
//  UserListNavigationHandling.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import DesignSystem

protocol UserListNavigationHandling: AnyObject, FeedbackDisplaying {
    func didSelectUser(_ username: String)
}
