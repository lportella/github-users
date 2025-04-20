//
//  UserDetailsNavigationHandling.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

protocol UserDetailsNavigationHandling: AnyObject {
    func didSelectRepository(with urlString: String)
}
