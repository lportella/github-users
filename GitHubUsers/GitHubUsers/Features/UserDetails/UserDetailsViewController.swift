//
//  UserDetailsViewController.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import DesignSystem
import UIKit

final class UserDetailsViewController: UIViewController {
    var loadingView: DesignSystem.ViewLoading = LoadingView()
    
    private let viewModel: UserDetailsViewModel
    
    init(viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: View Components
    lazy var collectionView: UICollectionView = {
        let layout = getCollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = CustomColors.primaryBackground.color
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, RepositoryItem>?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await viewModel.fetchFullUserDetails()
        }
    }
}

extension UserDetailsViewController: ViewBuilding {
    func setupViews() {
        view.backgroundColor = CustomColors.primaryBackground.color
        collectionView.register(
            SimpleCardViewCell.self,
            forCellWithReuseIdentifier: SimpleCardViewCell.reuseIdentifier
        )
        collectionView.register(
            ProfileHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProfileHeaderView.reuseIdentifier
        )
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension UserDetailsViewController: UICollectionViewDelegate {
    // MARK: Implement delegate for repository clicked
}

extension UserDetailsViewController: ViewControllerDisplaying {
    func handleLoading(_ isLoading: Bool) {
        func handleLoading(_ isLoading: Bool) {
            if isLoading {
                loadingView.start(in: self)
            } else {
                loadingView.stop()
            }
        }
    }
}


extension UserDetailsViewController: UserDetailsDisplaying {
    func handleUserDetails(_ userDetails: UserDetailsModel, _ userRepos: [UserRepositoryModel]) {
        // MARK: To do - implement functions to create view components
    }
    
    func didSelectRepository(_ repository: UserRepositoryModel) {
        viewModel.didSelectRepository(repository)
    }
}

private extension UserDetailsViewController {
    func getCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self.createProfileSection()
            default:
                return self.createRepositoriesSection()
            }
        }
    }
    
    private func createProfileSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(160)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(160)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]

        return section
    }
    
    private func createRepositoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(80)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [sectionHeader]
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)

        return section
    }
}
