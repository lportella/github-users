//
//  UserRepositoryModelMock.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation

@testable import GitHubUsers

extension UserRepositoryModel {
    static var fakeJSON: String {
        """
            [
              {
                "id": 1296269,
                "name": "Hello-World",
                "description": "This your first repo!",
                "fork": false,
                "url": "https://api.github.com/repos/octocat/Hello-World",
                "svn_url": "https://svn.github.com/octocat/Hello-World",
                "language": null,
                "stargazers_count": 80,
              }
            ]
        """
    }
    
    static var fixture: [UserRepositoryModel] {
        do {
            guard let data = fakeJSON.data(using: .utf8) else {
                fatalError("Could not convert fake JSON to data")
            }
            return try JSONDecoder().decode([Self].self, from: data)
        } catch {
            fatalError("Failed to decode with fake JSON. \(error)")
        }
    }
}
