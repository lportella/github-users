//
//  SimpleCardViewCell.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit
import SDWebImage

/// This reusable cell is a simple cell displaying:
/// -    imageView: one centered image
/// -    text: a label centered below the image
public class SimpleCardViewCell: UICollectionViewCell {
    static public let reuseIdentifier = "SimpleCard"
    
    private var currentImageURL: URL?
    
    lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = CustomSize.base4.value
        container.backgroundColor = CustomColors.secondaryBackground.color
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = ImageSize.medium.cornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var cardLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: TextSize.medium.value, weight: .bold)
        label.textColor = UIColor(named: CustomColors.primaryBlack.name)
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
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        imageView.sd_cancelCurrentImageLoad()
        imageView.image = nil
        currentImageURL = nil
        cardLabel.text = nil
    }
}

extension SimpleCardViewCell: ViewBuilding {
    func setupViews() {
        containerView.addSubview(imageView)
        containerView.addSubview(cardLabel)
        addSubview(containerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: CustomSize.base1.value),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CustomSize.base1.value),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CustomSize.base1.value),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CustomSize.base1.value),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: CustomSize.base4.value),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: ImageSize.medium.value),
            imageView.heightAnchor.constraint(equalToConstant: ImageSize.medium.value),
            
            cardLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CustomSize.base4.value),
            cardLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: CustomSize.base3.value),
            cardLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -CustomSize.base2.value),
            cardLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -CustomSize.base3.value)
        ])
    }
}

public extension SimpleCardViewCell {
    func configure(with item: Item) {
        configureLabel(with: item.text)
        configureImageView(with: item.imageURL, item.placeholderImage)
    }
}

private extension SimpleCardViewCell {
    func configureLabel(with text: String) {
        cardLabel.isHidden = cardLabel.text?.isEmpty == true
        cardLabel.text = text
    }
    
    func configureImageView(with imageURL: URL?, _ placeholderImage: UIImage?) {
        imageView.sd_cancelCurrentImageLoad()
        currentImageURL = imageURL
        imageView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
}
