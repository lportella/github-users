//
//  NetworkExposableMock.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/20.
//


@testable import NetworkKit

public final class NetworkExposableMock: Networking {
    public init() {}

    public var expectedResult: Result<any Decodable, ApiError>?

    public func request<T>(_ endpoint: any EndpointData) async throws -> T where T: Decodable {
        guard let result = expectedResult as? Result<T, ApiError> else {
            fatalError("Expected result is nil or has the wrong type. Expected: \(T.self)")
        }

        switch result {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}
