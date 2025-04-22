//
//  FeedbackViewProtocol.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public protocol FeedbackViewDisplaying {
    @MainActor func configure(with item: FeedbackViewItem)
}
