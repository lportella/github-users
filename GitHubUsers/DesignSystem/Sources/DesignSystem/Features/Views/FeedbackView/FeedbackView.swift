//
//  FeedbackView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/22.
//

import UIKit

public class FeedbackViewController: UIViewController {
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.primaryBackground.color
        view.layer.cornerRadius = CustomSize.base5.value
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var message: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = CustomSize.base4.value
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBuilding()
    }
}

extension FeedbackViewController: ViewBuilding {
    func setupViews() {
        view.backgroundColor = CustomColors.primaryBackground.color
        view.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(message)
        containerView.addSubview(buttonStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -CustomSize.base8.value),
            imageView.heightAnchor.constraint(equalToConstant: ImageSize.feedbackMediumImage.value),
            imageView.widthAnchor.constraint(equalToConstant: ImageSize.feedbackMediumImage.value),

            message.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CustomSize.base6.value),
            message.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: CustomSize.base6.value),
            message.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -CustomSize.base6.value),


            buttonStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: CustomSize.base6.value),
            buttonStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -CustomSize.base6.value),
            buttonStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -CustomSize.base7.value)
        ])
    }
}

extension FeedbackViewController: FeedbackViewDisplaying {
    public func configure(with item: FeedbackViewItem) {
        setupFeedbackImage(with: item.image)
        setupFeedbackMessage(with: item.message)
        setupFooterButtons(with: item.buttons)
    }
}

private extension FeedbackViewController {
    func setupFeedbackImage(with image: UIImage?) {
        imageView.image = image
    }
    
    func setupFeedbackMessage(with messageText: String) {
        message.text = messageText
    }
    
    func setupFooterButtons(with footerButtons: [FeedbackViewItem.Button]) {
        for button in footerButtons {
            let footerButton = createButton(buttonItem: button)
            buttonStack.addArrangedSubview(footerButton)
        }
    }
    
    func createButton(buttonItem: FeedbackViewItem.Button) -> UIButton {
        let button = UIButton(type: .system)
        
        let action = UIAction { [weak self] _ in
            switch buttonItem.action {
            case .dismiss:
                self?.dismiss(animated: true)
            case .action(let completionHandler):
                self?.dismiss(animated: true)
                completionHandler()
            }
        }
        
        button.backgroundColor = buttonItem.backgroundColor
        button.setTitleColor(buttonItem.textColor, for: .normal)
        button.layer.cornerRadius = CustomSize.base4.value
        button.setTitle(buttonItem.title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.addAction(action, for: .touchUpInside)
        return button
    }
}
