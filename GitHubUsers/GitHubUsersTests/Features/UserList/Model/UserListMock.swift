//
//  UserListMock.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation

@testable import GitHubUsers

extension BaseUser {
    static var baseUserfakeJSON: String {
        """
            [
              {
                "login": "octocat",
                "id": 1,
                "avatar_url": "https://github.com/images/error/octocat_happy.gif"
              }
            ]
        """
    }
    
    static var baseUserFixture: [BaseUser] {
        do {
            guard let data = baseUserfakeJSON.data(using: .utf8) else {
                fatalError("Could not convert fake JSON to data")
            }
            return try JSONDecoder().decode([Self].self, from: data)
        } catch {
            fatalError("Failed to decode with fake JSON. \(error)")
        }
    }
}
