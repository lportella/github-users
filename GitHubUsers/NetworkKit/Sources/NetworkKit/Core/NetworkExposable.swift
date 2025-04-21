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

#if DEBUG
final class NetworkExposableMock: Networking {
    typealias MultipleResults = [Result<Any, ApiError>]
    
    public var expectedResult: Result<Any, ApiError>?
    public var expectedResults: MultipleResults?
    
    private var requestCount = 0
    
    public init() {}

    public func request<T>(_ endpoint: any EndpointData) async throws -> T where T: Decodable {
        if let result = expectedResult {
            return try await singleResult(result)
        } else if let results = expectedResults {
            return try await multipleResult(results: results)
        }
        
        fatalError("No expected results were found")
    }
    
    private func singleResult<T: Decodable>(_ genericResult: Result<Any, ApiError>) async throws -> T {
        switch genericResult {
        case .success(let response):
            guard let responseValue = response as? T else {
                fatalError("Unexpected type. Expected: \(T.self), but got: \(type(of: response))")
            }
            return responseValue
        case .failure(let error):
            throw error
        }
    }
    
    private func multipleResult<T: Decodable>(results: MultipleResults) async throws -> T {
        guard requestCount < results.count else {
            fatalError("No more mock results left.")
        }

        defer {
            requestCount += 1
        }
        
        let result = results[requestCount]

        switch result {
        case .success(let response):
            guard let responseValue = response as? T else {
                fatalError("Unexpected type. Expected: \(T.self), but got: \(type(of: response))")
            }
            return responseValue
        case .failure(let error):
            throw error
        }
    }
}
#endif
