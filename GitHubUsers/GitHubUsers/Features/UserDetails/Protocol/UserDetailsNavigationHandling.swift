//
//  UserDetailsNavigationHandling.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation

protocol UserDetailsNavigationHandling: AnyObject {
    func didSelectRepository(with url: URL)
}
