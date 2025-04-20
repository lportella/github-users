//
//  UserListDisplaying.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

protocol UserListDisplaying {
    func handleUserList(_ userList: [BaseUser])
    func didSelectUser(_ user: BaseUser)
}
