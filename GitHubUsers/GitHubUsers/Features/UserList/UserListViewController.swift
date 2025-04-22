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
        let collectionView = UICollectionView()
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(named: CustomColors.primaryBackground.name)
        collectionView.delegate = self
        return collectionView
    }()
    
    init(viewModel: UserListUseCase) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        Task {
            await viewModel.fetchUserList()
        }
    }
}

extension UserListViewController: UICollectionViewDelegate {
    // MARK: To do - implement collection view delegates
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
        print("got user list")
        // MARK: To do - implement user list
    }
    
    func didSelectUser(_ user: BaseUser) {
        viewModel.didSelectUser(user)
    }
}
