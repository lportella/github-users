//
//  CustomColors.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

public enum CustomColors: String {
    case primaryBackground = "primaryBackground"
    case secondaryBackground = "secondaryBackground"
    case primaryBlack = "customBlack"
    case customBlue = "customBlue"
    
    public var name: String {
        return self.rawValue
    }
    
    public var color: UIColor? {
        UIColor(named: name, in: .module, compatibleWith: nil)
    }
}
