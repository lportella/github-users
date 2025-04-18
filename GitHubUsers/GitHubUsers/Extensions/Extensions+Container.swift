//
//  Extensions+Container.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import Swinject

/// Finds a valid dependency for the specified type
/// It will fail if the dependency is not properly registered
///
/// - Parameter type: Type describing the protocol to resolve
extension Container: ResolverProtocol {
    func resolve<T>(_ type: T.Type) -> T {
        guard let resolvedDependency = resolve(type) else {
            fatalError("Failed to resolve \(type) dependency")
        }
        return resolvedDependency
    }
}
