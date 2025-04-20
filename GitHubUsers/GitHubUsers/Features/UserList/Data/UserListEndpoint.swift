//
//  UserListEndpoint.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//

import NetworkKit
import Foundation

struct UserListEndpoint: EndpointData {
    var path: String {
        "/users"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? {
        [
            .init(name: "per_page", value: "21")
        ]
    }
}
