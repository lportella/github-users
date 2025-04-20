//
//  Coordinating.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit

protocol Coordinating {
    var navigationController: UINavigationController { get set }
    func start()
}
