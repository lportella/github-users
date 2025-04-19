//
//  DependencyContainer.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import Swinject
import NetworkKit

final class DependencyContainer {
    static let shared = DependencyContainer()
    let container: Container = Container()
    
    private init() {
        registerServices()
    }
    
    private func registerServices() {
        container.register(Networking.self) { _ in
            NetworkExposable()
        }
        // - To do: add webview registration
    }
}
