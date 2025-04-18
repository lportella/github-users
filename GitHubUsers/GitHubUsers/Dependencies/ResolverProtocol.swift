//
//  ResolverProtocol.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

protocol ResolverProtocol {
    func resolve<T>(_ type: T.Type) -> T
}
