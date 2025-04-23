//
//  Networking.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Foundation

public protocol Networking {
    func request<T>(_ endpoint: any EndpointData) async throws -> T where T: Decodable
}
