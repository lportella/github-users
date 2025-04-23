//
//  Extensions+EndpointData.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//

import NetworkKit
import Foundation

extension EndpointData {    
    var url: String {
        NetworkConfig.baseURL
    }
    
    var headers: [String : String] {
        var baseHeader = [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28"
        ]
        
        if let token = getBearerToken(), !token.isEmpty {
            baseHeader["Authorization"] = "Bearer \(token)"
        }
        
        return baseHeader
    }
    
    var body: Data? { nil }
}

fileprivate extension EndpointData {
    func getBearerToken() -> String? {
        NetworkConfig.githubToken
    }
}
