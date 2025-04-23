//
//  FeedbackViewItem.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public struct FeedbackViewItem {
    let image: UIImage?
    let message: String
    let buttons: [Button]
    
    public init(image: UIImage?, message: String, buttons: [Button]) {
        self.image = image
        self.message = message
        self.buttons = buttons
    }
}

public extension FeedbackViewItem {
    struct Button {
        let title: String
        let action: FeedbackAction
        let backgroundColor: UIColor?
        let textColor: UIColor?
        
        public init(title: String, action: FeedbackAction, backgroundColor: UIColor?, textColor: UIColor?) {
            self.title = title
            self.action = action
            self.backgroundColor = backgroundColor
            self.textColor = textColor
        }
    }
}
