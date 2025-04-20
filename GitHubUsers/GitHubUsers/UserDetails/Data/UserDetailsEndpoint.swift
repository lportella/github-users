//
//  UserDetailsEndpoint.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import NetworkKit
import Foundation

struct UserDetailsEndpoint: EndpointData {
    let username: String
    
    var path: String {
        "/users/\(username)"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? { nil }
}
