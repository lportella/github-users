//
//  RequestUseCase.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/19.
//
import DesignSystem
import NetworkKit

protocol RequestUseCase {
    var onLoadingChanged: ((_ isLoading: Bool) -> Void)? { get set }
}
