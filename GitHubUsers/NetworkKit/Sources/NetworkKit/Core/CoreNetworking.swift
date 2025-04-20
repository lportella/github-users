//
//  CoreNetworking.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Foundation

class CoreNetworking {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: any EndpointData) async throws -> T {
        let (data, response): (Data, URLResponse)

        do {
            let urlRequest = try handleURL(endpoint)
            (data, response) = try await session.data(for: urlRequest)
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
    
    func handleURL(_ endpointData: EndpointData) throws -> URLRequest {
        guard
            let fullURLString = endpointData.buildURLString(),
            let url = URL(string: fullURLString)
        else {
            throw ApiError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpointData.method.rawValue
        urlRequest.allHTTPHeaderFields = endpointData.headers
        urlRequest.httpBody = endpointData.body
        return urlRequest
    }
}
