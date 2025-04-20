//
//  UserListViewController.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/18.
//

import UIKit

final class UserListViewController: UIViewController {
    private let viewModel: UserListUseCase
    
    init(viewModel: UserListUseCase) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        Task {
            await viewModel.fetchUserList()
        }
    }
}

extension UserListViewController: ViewControllerDisplaying {
    func handleLoading(_ isLoading: Bool) {
        print("is loading: \(isLoading)")
        // MARK: To do - implement loading view
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
