//
//  UserDetailsModelMock.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation

@testable import GitHubUsers

extension UserDetailsModel {
    static var fakeJSON: String {
        """
            {
              "login": "octocat",
              "id": 1,
              "avatar_url": "https://github.com/images/error/octocat_happy.gif",
              "name": "monalisa octocat",
              "followers": 20,
              "following": 0
            }
        """
    }
    
    static var fixture: Self {
        do {
            guard let data = fakeJSON.data(using: .utf8) else {
                fatalError("Could not convert fake JSON to data")
            }
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            fatalError("Failed to decode with fake JSON. \(error)")
        }
    }
}

