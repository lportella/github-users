//
//  CustomSize.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import Foundation

public enum CustomSize: CGFloat {
    case none = 0
    case base1 = 2
    case base2 = 4
    case base3 = 8
    case base4 = 12
    case base5 = 14
    case base6 = 16
    case base7 = 32
    case base8 = 48
    
    public var value: CGFloat {
        return self.rawValue
    }
}
