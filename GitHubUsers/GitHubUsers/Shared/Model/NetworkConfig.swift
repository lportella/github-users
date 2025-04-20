//
//  NetworkConfig.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//

import Foundation

enum NetworkConfig {
    static var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("Invalid base URL")
        }
        return url
    }
}
