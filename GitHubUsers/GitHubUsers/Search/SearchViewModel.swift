//
//  SearchViewModel.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import NetworkKit

final class SearchViewModel {
    private let networkService: Networking
        
    init(networkService: Networking) {
        self.networkService = networkService
    }
}
