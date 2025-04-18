//
//  NetworkExposable.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Combine

public class NetworkExposable: Networking {
    public func request<T>(_ endpoint: any EndpointData) -> AnyPublisher<T, ApiError> where T : Decodable {
        CoreNetworking().request(endpoint)
    }
}
