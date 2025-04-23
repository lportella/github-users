//
//  FeedbackDisplaying.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

public protocol FeedbackDisplaying {
    @MainActor func displayFeedbackSystem(_ feedbackItem: FeedbackViewItem)
}
