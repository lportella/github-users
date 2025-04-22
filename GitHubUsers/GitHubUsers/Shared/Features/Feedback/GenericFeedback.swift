//
//  GenericFeedback.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/22.
//

import DesignSystem
import UIKit

enum GenericFeedback {
    static var genericFeedbackItem: FeedbackViewItem {
        FeedbackViewItem(
            image: UIImage(named: "GenericError"),
            message: "Oops! We encountered an unexpected error.\nPlease try again.",
            buttons: [
                .init(
                    title: "Go Back",
                    action: .dismiss,
                    backgroundColor: CustomColors.customBlue.color,
                    textColor: CustomColors.primaryBackground.color
                )
            ]
        )
    }
}
