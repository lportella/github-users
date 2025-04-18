//
//  DependencyContainer.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import Swinject

final class DependencyContainer {
    static let shared = DependencyContainer()
    let container: Container = Container()
    
    private init() {
        registerServices()
    }
    
    private func registerServices() {
        // - To do: add networking registration
        // - To do: add webview registration
    }
}
