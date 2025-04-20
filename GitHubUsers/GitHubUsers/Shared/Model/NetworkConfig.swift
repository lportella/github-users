//
//  NetworkConfig.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//

import Foundation

enum NetworkConfig {
    static var baseURL: String = "api.github.com"
    
    static var githubToken: String? {
        Bundle.main.object(forInfoDictionaryKey: "GITHUB_API_TOKEN") as? String
    }
}
