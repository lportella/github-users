//
//  ProfileHeaderView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit
import SDWebImage

public final class ProfileHeaderView: UICollectionReusableView {
    static public let reuseIdentifier = "HeaderView"
    private var currentImageURL: URL?
    
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
        label.font = UIFont.systemFont(ofSize: TextSize.large.value, weight: .bold)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .regular)
        label.textColor = CustomColors.customLightGray.color
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followersDetail: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .semibold)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CustomSize.base4.value
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = CustomSize.base2.value
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
        avatar.sd_cancelCurrentImageLoad()
        avatar.image = nil
        currentImageURL = nil
        username.text = nil
        name.text = nil
        followersDetail.text = nil
    }
}

extension ProfileHeaderView: ViewBuilding {
    func setupViews() {
        detailsStackView.addArrangedSubview(username)
        detailsStackView.addArrangedSubview(name)
        detailsStackView.setCustomSpacing(CustomSize.base4.value, after: name)
        detailsStackView.addArrangedSubview(followersDetail)
        detailsStackView.setCustomSpacing(CustomSize.base4.value, after: followersDetail)
        mainStackView.addArrangedSubview(avatar)
        mainStackView.addArrangedSubview(detailsStackView)
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalToConstant: ImageSize.large.value),
            avatar.heightAnchor.constraint(equalToConstant: ImageSize.large.value),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: CustomSize.base6.value),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CustomSize.base6.value),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

public extension ProfileHeaderView {
    func configure(with item: Item) {
        configureAvatar(with: item.avatarURL, item.placeholderImage)
        configureUsernameLabel(with: item.username)
        configureNameLabel(with: item.name)
        configureFollowersLabel(item.followers, item.following)
    }
}

private extension ProfileHeaderView {
    func configureAvatar(with imageURL: URL?, _ placeholderImage: UIImage?) {
        avatar.sd_cancelCurrentImageLoad()
        currentImageURL = imageURL
        avatar.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
    
    func configureUsernameLabel(with text: String) {
        username.text = text
    }
    
    func configureNameLabel(with text: String?) {
        guard let text else {
            name.text = nil
            name.isHidden = true
            return
        }
        name.text = text
        name.isHidden = false
    }
    
    func configureFollowersLabel(_ followersCount: Int, _ followingCount: Int) {
        followersDetail.text = "\(followersCount) Followers    \(followingCount) Following"
    }
}
