//
//  ProfileHeaderViewItem.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

public extension ProfileHeaderView {
    struct Item {
        let avatarURL: URL?
        let username: String
        let name: String?
        let followers: Int
        let following: Int
        let placeholderImage: UIImage?
        
        public init(
            avatarURL: URL?,
            username: String,
            name: String?,
            followers: Int,
            following: Int,
            placeholderImage: UIImage?
        ) {
            self.avatarURL = avatarURL
            self.username = username
            self.name = name
            self.followers = followers
            self.following = following
            self.placeholderImage = placeholderImage
        }
    }
}
