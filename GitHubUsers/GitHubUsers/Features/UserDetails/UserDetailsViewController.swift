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
