//
//  EmptyViewItem.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public extension EmptyView {
    struct Item {
        let message: String
        let image: UIImage?
        
        public init(message: String, image: UIImage?) {
            self.message = message
            self.image = image
        }
    }
}
