//
//  UserListViewController.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import DesignSystem
import UIKit

final class UserListViewController: UIViewController {
    var loadingView: DesignSystem.ViewLoading = LoadingView()
    
    private let viewModel: UserListUseCase
    
    // MARK: View Components
    lazy var collectionView: UICollectionView = {
        let layout = getCollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = CustomColors.primaryBackground.color
        collectionView.refreshControl = refreshControl
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, BaseUser>?
    
    init(viewModel: UserListUseCase) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBuilding()
        setupCollectionViewDataSource()
        Task {
            await viewModel.fetchUserList()
        }
    }
}

extension UserListViewController: ViewBuilding {
    func setupViews() {
        view.backgroundColor = CustomColors.primaryBackground.color
        collectionView.register(
            SimpleCardViewCell.self,
            forCellWithReuseIdentifier: SimpleCardViewCell.reuseIdentifier
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

extension UserListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedUser = dataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        viewModel.didSelectUser(selectedUser)
    }
}

extension UserListViewController: ViewControllerDisplaying {
    func handleLoading(_ isLoading: Bool) {
        if isLoading {
            loadingView.start(in: self)
        } else {
            loadingView.stop()
        }
    }
}

extension UserListViewController: UserListDisplaying {
    func handleUserList(_ userList: [BaseUser]) {
        applySnapshot(with: userList)
        refreshControl.endRefreshing()
    }
    
    func didSelectUser(_ user: BaseUser) {
        viewModel.didSelectUser(user)
    }
}

private extension UserListViewController {
    @objc func onPullToRefresh() {
        Task {
            await viewModel.fetchUserList()
            await MainActor.run {
                refreshControl.endRefreshing()
            }
        }
    }
    
    func getCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0/2.0),
                heightDimension: .estimated(100)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(100)
            )

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            section.interGroupSpacing = 16

            return section
        }
    }
    
    func setupCollectionViewDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, BaseUser>(
            collectionView: collectionView
        ) { collectionView, indexPath, item -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SimpleCardViewCell.reuseIdentifier,
                for: indexPath
            ) as? SimpleCardViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: .init(
                text: item.login,
                imageURL: URL(string: item.avatarUrl)
            ))
            return cell
        }
    }
    
    private func applySnapshot(with items: [BaseUser]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, BaseUser>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        
        if let dataSource {
            dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}
