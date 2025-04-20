//
//  Extensions+HTTPURLResponse.swift
//  NetworkKit
//
//  Created by Lucas Portella on 2025/04/19.
//

import Foundation

extension HTTPURLResponse {
    var isSuccessful: Bool {
        (200..<300) ~= statusCode
    }
}
