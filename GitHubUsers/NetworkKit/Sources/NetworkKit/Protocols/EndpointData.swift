//
//  EndpointData.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Foundation

public protocol EndpointData {
    var scheme: String { get }
    var url: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}
