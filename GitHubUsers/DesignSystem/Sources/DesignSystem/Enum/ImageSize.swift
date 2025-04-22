//
//  ImageSize.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import Foundation

public enum ImageSize: CGFloat {
    case small = 28
    case medium = 48
    case large = 90
    case feedbackMediumImage = 120
    case feedbackLargeImage = 200
    
    public var value: CGFloat {
        return self.rawValue
    }
    
    public var cornerRadius: CGFloat {
        return self.rawValue / 2
    }
}
