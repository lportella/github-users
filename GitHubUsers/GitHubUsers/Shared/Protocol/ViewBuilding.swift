//
//  ViewBuilding.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

protocol ViewBuilding {
    func setupViewBuilding()
    func setupViews()
    func setupConstraints()
}

extension ViewBuilding {
    func setupViewBuilding() {
        setupViews()
        setupConstraints()
    }
}
