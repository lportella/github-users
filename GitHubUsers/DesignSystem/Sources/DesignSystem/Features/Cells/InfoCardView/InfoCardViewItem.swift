//
//  InfoCardViewItem.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

public extension InfoCardView {
    struct Item {
        let title: String
        let subtitle: String?
        let leftDetail: String?
        let rightDetail: String
        
        public init(title: String, subtitle: String?, leftDetail: String?, rightDetail: String) {
            self.title = title
            self.subtitle = subtitle
            self.leftDetail = leftDetail
            self.rightDetail = rightDetail
        }
    }
}
