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
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewBuilding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subtitle.text = nil
        leftDetail.text = nil
        rightDetail.text = nil
    }
}

extension InfoCardView: ViewBuilding {
    func setupViews() {
        horizontalStack.addArrangedSubview(leftDetail)
        horizontalStack.addArrangedSubview(rightDetail)
        verticalStack.addArrangedSubview(title)
        verticalStack.addArrangedSubview(subtitle)
        verticalStack.addArrangedSubview(horizontalStack)
        containerView.addSubview(verticalStack)
        contentView.addSubview(containerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            verticalStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            verticalStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            verticalStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14)
        ])
    }
}

public extension InfoCardView {
    func configure(with item: Item) {
        title.text = item.title
        subtitle.text = item.subtitle
        rightDetail.text = item.rightDetail
        leftDetail.text = item.leftDetail
    }
}
