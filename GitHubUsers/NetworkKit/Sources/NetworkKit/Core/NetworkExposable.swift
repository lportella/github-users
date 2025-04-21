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
    
    public var expectedResult: Result<any Decodable, ApiError>?
    public var expectedResults: MultipleResults?
    
    private var requestCount = 0
    
    public init() {}

    public func request<T>(_ endpoint: any EndpointData) async throws -> T where T: Decodable {
        if expectedResult != nil {
            return try await singleResult()
        } else if let results = expectedResults {
            return try await multipleResult(results: results)
        }
        
        fatalError("No expected results were found")
    }
    
    private func singleResult<T: Decodable>() async throws -> T {
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
