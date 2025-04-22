//
//  UserDetailsNavigationHandling.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import DesignSystem
import Foundation

protocol UserDetailsNavigationHandling: AnyObject, FeedbackDisplaying {
    func didSelectRepository(with url: URL)
}
