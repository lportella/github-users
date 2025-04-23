//
//  SectionHeaderView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public final class SectionHeaderView: UICollectionReusableView {
    static public let reuseIdentifier = "SectionHeaderView"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: TextSize.large.value)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewBuilding()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(title: String) {
        titleLabel.text = title
    }
}

extension SectionHeaderView: ViewBuilding {
    func setupViews() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CustomSize.base6.value),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CustomSize.base6.value),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
