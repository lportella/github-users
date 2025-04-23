//
//  LoadingViewProtocol.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

@MainActor
public protocol ViewLoading {
    func start(in viewController: UIViewController)
    func stop()
}
