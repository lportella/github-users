//
//  ViewBuilding.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

@MainActor
protocol ViewBuilding: AnyObject {
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
