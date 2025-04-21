//
//  SimpleCardViewCell.swift
//  DesignSystem
//
//  Created by Lucas Portella on 2025/04/21.
//

import UIKit

/// This reusable cell is a simple cell displaying:
/// -    imageView: one centered image
/// -    text: a label centered below the image
class SimpleCardViewCell: UICollectionViewCell {
    lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 14
        container.backgroundColor = UIColor(red: 240/255.0, green: 241/255.0, blue: 246/255.0, alpha: 1.0)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var text: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 17/255.0, green: 20/255.0, blue: 31/255.0, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
