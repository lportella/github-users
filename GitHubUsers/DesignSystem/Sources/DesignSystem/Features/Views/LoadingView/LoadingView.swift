//
//  LoadingView.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

public final class LoadingView: UIView {
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewBuilding()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingView: ViewBuilding {
    func setupViews() {
        backgroundColor = UIColor.black.withAlphaComponent(0.1)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension LoadingView: ViewLoading {
    public func start(in viewController: UIViewController) {
        guard superview == nil else {
            return
        }

        if let window = viewController.view.window {
            frame = window.bounds
            window.addSubview(self)
            activityIndicator.startAnimating()
        }
    }

    public func stop() {
        activityIndicator.stopAnimating()
        removeFromSuperview()
    }
}
