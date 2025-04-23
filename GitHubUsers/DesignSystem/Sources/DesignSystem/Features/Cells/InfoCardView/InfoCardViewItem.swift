//
//  InfoCardViewItem.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

public extension InfoCardView {
    struct Item {
        let title: String
        let subtitle: String?
        let details: [IconTextViewItem]
        
        public init(title: String, subtitle: String?, details: [IconTextViewItem]) {
            self.title = title
            self.subtitle = subtitle
            self.details = details
        }
    }
}
