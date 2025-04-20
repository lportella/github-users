//
//  UserRepositoriesEndpoint.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import NetworkKit
import Foundation

struct UserRepositoriesEndpoint: EndpointData {
    let username: String
    
    var path: String {
        "/users/\(username)/repos"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var queryItems: [URLQueryItem]? {
        [
            .init(name: "type", value: "owner"),
            .init(name: "sort", value: "updated"),
            .init(name: "direction", value: "desc")
        ]
    }
}
