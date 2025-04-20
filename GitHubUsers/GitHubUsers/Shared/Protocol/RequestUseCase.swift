//
//  RequestUseCase.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//
import NetworkKit

protocol RequestUseCase {
    var onLoadingChanged: (([BaseUser]) -> Void)? { get set }
    var onError: (([ApiError]) -> Void)? { get set }
}
