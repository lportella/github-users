//
//  FeedbackViewActions.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

public enum FeedbackAction {
    case dismiss
    case action(() -> Void)
}
