//
//  UserListNavigationHandling.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

protocol UserListNavigationHandling: AnyObject {
    func didSelectUser(_ username: String)
}
