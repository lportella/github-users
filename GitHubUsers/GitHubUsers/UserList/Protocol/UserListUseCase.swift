//
//  UserListUseCase.swift.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//

protocol UserListUseCase {
    var onUserListLoaded: (([BaseUser]) -> Void)? { get set }
    func fetchUserList() async
}
