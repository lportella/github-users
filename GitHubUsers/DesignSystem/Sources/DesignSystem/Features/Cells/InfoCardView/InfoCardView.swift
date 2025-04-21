//
//  InfoCardView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

public class InfoCardView: UICollectionViewCell {
    lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = CustomSize.base4.value
        container.backgroundColor = UIColor(named: CustomColors.primaryBackground.name)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .bold)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: TextSize.small.value, weight: .regular)
        label.textColor = UIColor(cgColor: .init(red: 38/255, green: 40/255, blue: 46/255, alpha: 1))
        // MARK: Testing colors! Move it to Colors.xcassets after validating.
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: TextSize.small.value, weight: .light)
        label.textColor = UIColor(cgColor: .init(red: 118/255, green: 120/255, blue: 136/255, alpha: 1))
        // MARK: Testing colors! Move it to Colors.xcassets after validating.
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: TextSize.small.value, weight: .light)
        label.textColor = UIColor(cgColor: .init(red: 38/255, green: 40/255, blue: 46/255, alpha: 1))
        // MARK: Testing colors! Move it to Colors.xcassets after validating.
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}
