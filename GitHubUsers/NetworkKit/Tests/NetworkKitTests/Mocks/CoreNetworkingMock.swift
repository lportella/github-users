//
//  CoreNetworkingMock.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation

@testable import NetworkKit

public final class CoreNetworkingMock<T: Decodable> {
    var expectedResult: Result<T, ApiError>?

    func request() async throws -> T {
        guard let expectedResult else {
            fatalError("Expected result not set before calling request")
        }

        switch expectedResult {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}
