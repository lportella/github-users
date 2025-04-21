//
//  ProfileHeaderView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit
import SDWebImage

public final class ProfileHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "HeaderView"
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = ImageSize.large.cornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var username: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .bold)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: TextSize.small.value, weight: .regular)
        label.textColor = UIColor(cgColor: .init(red: 38/255, green: 40/255, blue: 46/255, alpha: 1))
        // MARK: Testing colors! Move it to Colors.xcassets after validating.
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followers: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .regular)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var following: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .regular)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
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
}

extension ProfileHeaderView: ViewBuilding {
    func setupViews() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalToConstant: ImageSize.large.value),
            avatar.heightAnchor.constraint(equalToConstant: ImageSize.large.value),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: CustomSize.base6.value),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CustomSize.base6.value),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
