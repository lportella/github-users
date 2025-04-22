//
//  EmptyView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public final class EmptyView: UICollectionViewCell {
    static public let reuseIdentifier = "EmptyView"

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray3
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var message: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.numberOfLines = 0
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
}

extension EmptyView: ViewBuilding {
    func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(message)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CustomSize.base3.value),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: ImageSize.large.value),
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: ImageSize.large.value),

            message.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CustomSize.base3.value),
            message.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomSize.base6.value),
            message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CustomSize.base6.value),
            message.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -CustomSize.base6.value)
        ])
    }
}

public extension EmptyView {
    func configure(with item: Item) {
        setupImage(with: item.image)
        setupMessage(with: item.message)
    }
}

private extension EmptyView {
    func setupImage(with image: UIImage?) {
        imageView.image = image
        imageView.isHidden = (image == nil)
    }
    
    func setupMessage(with messageText: String) {
        message.text = messageText
    }
}
