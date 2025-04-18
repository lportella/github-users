//
//  ApiError.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/18.
//

import Foundation

public enum ApiError: Error {
    case decoding(Error)
    case network(Error)
    case httpStatus(code: Int, data: Data)
    case unknown
}
