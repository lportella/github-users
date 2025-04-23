//
//  IconTextView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public class IconTextView: UIStackView {
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = CustomColors.customLightGray.color
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: TextSize.small.value, weight: .light)
        label.textColor = .gray
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupViewBuilding()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconTextView: ViewBuilding {
    func setupViews() {
        setupCollectionView()
        addArrangedSubview(iconImageView)
        addArrangedSubview(textLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: CustomSize.base5.value),
            iconImageView.heightAnchor.constraint(equalToConstant: CustomSize.base5.value)
        ])
    }
}

public extension IconTextView {
    func configure(with item: IconTextViewItem) {
        setupText(with: item.text)
        setupImage(with: item.icon)
        shouldHideStackView(for: item.text)
    }
    
    func prepareForReuse() {
        iconImageView.image = nil
        textLabel.text = nil
    }
}

private extension IconTextView {
    func setupCollectionView() {
        axis = .horizontal
        alignment = .center
        spacing = 4
    }
    
    func setupText(with text: String?) {
        textLabel.text = text
    }
    
    func setupImage(with image: UIImage?) {
        iconImageView.image = image
        iconImageView.isHidden = image == nil
    }
    
    func shouldHideStackView(for text: String?) {
        isHidden = text?.isEmpty ?? true
    }
}
