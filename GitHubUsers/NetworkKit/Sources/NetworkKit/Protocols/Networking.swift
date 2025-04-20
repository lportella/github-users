//
//  Networking.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Combine
import Foundation

public protocol Networking {
    func request<T>(_ endpoint: any EndpointData) -> AnyPublisher<T, ApiError> where T: Decodable
    func request<T>(_ endpoint: any EndpointData) async throws -> T where T: Decodable
}
