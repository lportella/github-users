//
//  ViewControllerDisplaying.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import DesignSystem

protocol ViewControllerDisplaying {
    var loadingView: ViewLoading { get }
    func handleLoading(_ isLoading: Bool)
}
