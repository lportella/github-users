//
//  NetworkExposable.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

public final class NetworkExposable: Networking {
    public init() {}
    
    public func request<T>(_ endpoint: any EndpointData) async throws -> T where T: Decodable {
        return try await CoreNetworking().request(endpoint)
    }
}
