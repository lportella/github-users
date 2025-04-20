//
//  CoreNetworking.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Combine
import Foundation

class CoreNetworking {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(_ endpoint: any EndpointData) -> AnyPublisher<T, ApiError> where T : Decodable {
        let request = endpoint.url

        return session.dataTaskPublisher(for: request)
            .tryMap { [weak self] result in
                try self?.checkHTTPError(result)
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> ApiError in
                if let decodingError = error as? DecodingError {
                    return .decodingError(decodingError, data: nil)
                } else {
                    return .networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func request<T: Decodable>(_ endpoint: any EndpointData) async throws -> T {
        let (data, response): (Data, URLResponse)

        do {
            (data, response) = try await session.data(from: endpoint.url)
        } catch let urlError as URLError {
            throw ApiError.networkError(urlError)
        } catch {
            throw ApiError.unknown
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }

        guard httpResponse.isSuccessful else {
            throw ApiError.httpStatus(code: httpResponse.statusCode, data: data)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ApiError.decodingError(error, data: data)
        }
    }
}

private extension CoreNetworking {
    func checkHTTPError(_ result: URLSession.DataTaskPublisher.Output) throws {
        guard let response = result.response as? HTTPURLResponse else {
            throw ApiError.unknown
        }

        guard (200...299).contains(response.statusCode) else {
            throw ApiError.httpStatus(code: response.statusCode, data: result.data)
        }
    }
}
