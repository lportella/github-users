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
    
    var headers: [String : String]? {
        [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
            "Authorization": "Bearer <TO DO>"
        ]
    }
    
    var body: Data? { nil }
}
