//
//  EndpointData.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Foundation

public protocol EndpointData {
    var url: URL { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}
