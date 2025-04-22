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
        setupViewBuilding()
        setupCollectionViewRepoDataSource()
        Task {
            await viewModel.fetchFullUserDetails()
        }
    }
}

extension UserDetailsViewController: ViewBuilding {
    func setupViews() {
        view.backgroundColor = CustomColors.primaryBackground.color
        collectionView.register(
            InfoCardView.self,
            forCellWithReuseIdentifier: InfoCardView.reuseIdentifier
        )
        collectionView.register(
            ProfileHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProfileHeaderView.reuseIdentifier
        )
        collectionView.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.reuseIdentifier
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
        setupCollectionViewHeaderDataSource(with: userDetails)
        applySnapshot(with: userRepos)
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
    
    func setupCollectionViewRepoDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, RepositoryItem>(
            collectionView: collectionView
        ) {
            collectionView,
            indexPath,
            item in
            switch item {
            case .repository(let repo):
                if let repo {
                    guard let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: InfoCardView.reuseIdentifier,
                        for: indexPath
                    ) as? InfoCardView else {
                        return UICollectionViewCell()
                    }
                    cell.configure(
                        with: .init(
                            title: repo.name,
                            subtitle: repo.description,
                            leftDetail: repo.language,
                            rightDetail: String(repo.stargazersCount)
                        )
                    )
                    return cell
                } else {
                    // MARK: To do - Create empty cell
                    return UICollectionViewCell()
                }
            }
        }
    }
    
    func setupCollectionViewHeaderDataSource(with userDetails: UserDetailsModel) {
        dataSource?.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath
        ) -> UICollectionReusableView? in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }

            switch (kind, Section(rawValue: indexPath.section)) {
            case (UICollectionView.elementKindSectionHeader, .profile):
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: ProfileHeaderView.reuseIdentifier,
                    for: indexPath
                ) as? ProfileHeaderView else {
                    fatalError("Header not found")
                }
                
                header.configure(
                    with: .init(
                        avatarURL: URL(string: userDetails.avatarUrl),
                        username: userDetails.login,
                        name: userDetails.name,
                        followers: userDetails.followers,
                        following: userDetails.following,
                        placeholderImage: nil
                    )
                )
                return header
                
            case (UICollectionView.elementKindSectionHeader, .repositories):
                guard let repoHeaderSection = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                    for: indexPath
                ) as? SectionHeaderView else {
                    fatalError("Repository header not found")
                }
                repoHeaderSection.configure(title: "Repositories")
                return repoHeaderSection
            default:
                fatalError("Unregistered section found")
            }
        }
    }
    
    private func applySnapshot(with repositories: [UserRepositoryModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, RepositoryItem>()
        snapshot.appendSections([.profile, .repositories])

        if repositories.isEmpty {
            snapshot.appendItems([.repository(nil)], toSection: .repositories)
        } else {
            snapshot.appendItems(repositories.map { .repository($0) }, toSection: .repositories)
        }
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
