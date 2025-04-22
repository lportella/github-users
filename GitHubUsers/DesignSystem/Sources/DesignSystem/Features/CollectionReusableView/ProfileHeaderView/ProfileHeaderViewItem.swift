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
    }
}
