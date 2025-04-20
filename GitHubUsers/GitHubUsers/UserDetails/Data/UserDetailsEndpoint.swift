//
//  UserDetailsEndpoint.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import NetworkKit
import Foundation

struct UserDetailsEndpoint: EndpointData {
    var path: String {
        "to do"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? { nil }
}
