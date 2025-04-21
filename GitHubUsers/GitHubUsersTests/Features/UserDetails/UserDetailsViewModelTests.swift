//
//  UserDetailsViewModelTests.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
import Testing

@testable import NetworkKit
@testable import GitHubUsers

struct UserDetailsViewModelTests {
    
    @Test
    func testFetchFullUserDetails_WhenSuccess_ShouldDisplayAllUserData() async throws {
        let args = makeSUT()
        
        let expectedUser = UserDetailsModel.fixture
        let expectedRepos = UserRepositoryModel.fixture
        
        args.networkMock.expectedResults = [
            .success(expectedUser),
            .success(expectedRepos)
        ]
        
        try await args.sut.fetchFullUserDetails()
        
        #expect(args.viewControllerSpy.messages == [
            .handleLoading(true),
            .handleUserDetails(expectedUser, expectedRepos),
            .handleLoading(false)
        ])
    }
    
    @Test
    func testDidSelectRepository_WhenRepositorySelected_ShouldCreateURLAndDisplayWebView() async throws {
        let args = makeSUT()
        let userRepos = UserRepositoryModel.fixture
        
        let selectedRepo = try #require(userRepos.first)
        let expectedURL = try #require(URL(string: selectedRepo.repoUrl))
        
        args.sut.didSelectRepository(selectedRepo)
        
        #expect(args.coordinatorSpy.messages == [
            .didSelectRepository(expectedURL)
        ])
    }
}

private extension UserDetailsViewModelTests {
    typealias SUT = (
        sut: UserDetailsUseCase,
        networkMock: NetworkExposableMock,
        viewControllerSpy: UserDetailsViewControllerSpy,
        coordinatorSpy: UserDetailsCoordinatorSpy
    )
    
    func makeSUT() -> SUT {
        let networkMock = NetworkExposableMock()
        let viewControllerSpy = UserDetailsViewControllerSpy()
        let coordinatorSpy = UserDetailsCoordinatorSpy()
        let viewModel = UserDetailsViewModel(
            username: "testUser",
            networkService: networkMock
        )
        
        viewModel.onLoadingChanged = viewControllerSpy.handleLoading(_:)
        viewModel.onFullUserDetailsLoaded = viewControllerSpy.handleUserDetails(_:_:)
        viewModel.navigationHandler = coordinatorSpy
        
        return (viewModel, networkMock, viewControllerSpy, coordinatorSpy)
    }
}
