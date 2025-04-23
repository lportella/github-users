//
//  InfoCardView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

/// This reusable cell is a card displaying:
/// -    title: first text with bold weight
/// -    subtitle: second text, below title with a slightly brighter color and regular weight
/// -    leftDetail: horizontal text on the left, with a light color
/// -    rightDetail: horizontal text on the right, the same color as subtitle but with a light weight
public final class InfoCardView: UICollectionViewCell {
    static public let reuseIdentifier = "InfoCard"
    
    lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = CustomSize.base4.value
        container.backgroundColor = CustomColors.secondaryBackground.color
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
    
    lazy var verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
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
        clearStackView(footerStackView)
    }
}

extension InfoCardView: ViewBuilding {
    func setupViews() {
        verticalStack.addArrangedSubview(title)
        verticalStack.addArrangedSubview(subtitle)
        verticalStack.addArrangedSubview(footerStackView)
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
        setupTitle(with: item.title)
        setupSubtitle(with: item.subtitle)
        setupFooterDetails(with: item.details)
    }
}

private extension InfoCardView {
    func setupTitle(with titleText: String) {
        title.text = titleText
    }
    
    func setupSubtitle(with subtitleText: String?) {
        subtitle.text = subtitleText
        subtitle.isHidden = subtitleText?.isEmpty ?? true
    }
    
    /// Add detail if text is not nil
    func setupFooterDetails(with items: [IconTextViewItem]) {
        items.forEach {
            if let text = $0.text, !text.isEmpty {
                let detailStackView = IconTextView()
                detailStackView.configure(with: $0)
                footerStackView.addArrangedSubview(detailStackView)
            }
        }
        
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        footerStackView.addArrangedSubview(spacer)
    }
    
    func clearStackView(_ stackView: UIStackView) {
        stackView.arrangedSubviews.forEach { subview in
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
}
