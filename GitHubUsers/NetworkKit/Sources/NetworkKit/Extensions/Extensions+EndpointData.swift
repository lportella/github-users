//
//  Extensions+EndpointData.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/19.
//

import Foundation

extension EndpointData {
    func buildURLString() -> String? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = url
        components.path = path
        components.queryItems = queryItems
        return components.string
    }
}

public extension EndpointData {
    var scheme: String {
        "https"
    }
}
