//
//  TextSize.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import Foundation

public enum TextSize: CGFloat {
    case small = 14
    case medium = 16
    case large = 26
    
    public var value: CGFloat {
        return self.rawValue
    }
}
