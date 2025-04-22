//
//  UserDetailsCollectionViewSections.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/22.
//

extension UserDetailsViewController {
    enum Section: Int {
        case profile = 0
        case repositories = 1
    }
    
    enum RepositoryItem: Hashable {
        case repository(UserRepositoryModel?)
    }
}
