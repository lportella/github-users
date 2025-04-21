//
//  UserDetailsViewController.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import UIKit

final class UserDetailsViewController: UIViewController {
    private let viewModel: UserDetailsViewModel
    
    init(viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
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

extension UserDetailsViewController: ViewControllerDisplaying {
    func handleLoading(_ isLoading: Bool) {
        print("is loading: \(isLoading)")
        // MARK: To do - implement loading view
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
