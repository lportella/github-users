//
//  SearchFactory.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit
import Swinject
import NetworkKit

final class SearchFactory {
    static func make() -> UIViewController {
        let resolver = DependencyContainer.shared.container
        let viewModel = SearchViewModel(networkService: resolver.resolve(Networking.self))
        return SearchViewController()
    }
}
