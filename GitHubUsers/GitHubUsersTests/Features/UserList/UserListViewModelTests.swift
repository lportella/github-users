//
//  UserListViewModelTests.swift
//  GitHubUsers
//
//  Created by Lucas Portella on 2025/04/20.
//

import Foundation
import Testing

@testable import NetworkKit
@testable import GitHubUsers

struct UserListViewModelTests {
    
    @Test
    func testFetchUserList_WhenSuccess_ShouldReturnListOfUsers() async throws {
        let args = makeSUT()
        let expectedUserList = BaseUser.baseUserFixture
        
        args.networkMock.expectedResult = .success(expectedUserList)
        
        await args.sut.fetchUserList()
        
        #expect(args.viewControllerSpy.messages == [
            .handleLoading(true),
            .handleLoading(false),
            .handleUserList(expectedUserList)
        ])
    }
    
    @Test
    func testFetchUserList_WhenErrorOnRequest_ShouldReturnListOfUsers() async throws {
        let args = makeSUT()
        
        args.networkMock.expectedResult = .failure(.invalidResponse)
        
        await args.sut.fetchUserList()
        
        #expect(args.viewControllerSpy.messages == [
            .handleLoading(true),
            .handleLoading(false)
        ])
        
        #expect(args.coordinatorSpy.messages == [.displayFeedbackSystem])
    }
    
    @Test
    func testDidSelectUser_WhenUserSelected_ShouldPassUserLoginToNavigation() async throws {
        let args = makeSUT()
        let expectedUserList = BaseUser.baseUserFixture
        let expectedUser = try #require(expectedUserList.first)
        
        args.sut.didSelectUser(expectedUser)
        
        #expect(args.coordinatorSpy.messages == [.didSelectUser(expectedUser.login)])
    }
    
}

private extension UserListViewModelTests {
    typealias SUT = (
        sut: UserListUseCase,
        networkMock: NetworkExposableMock,
        viewControllerSpy: UserListViewControllerSpy,
        coordinatorSpy: UserListCoordinatorSpy
    )
    
    func makeSUT() -> SUT {
        let networkMock = NetworkExposableMock()
        let viewControllerSpy = UserListViewControllerSpy()
        let coordinatorSpy = UserListCoordinatorSpy()
        let viewModel = UserListViewModel(networkService: networkMock)
        
        viewModel.onLoadingChanged = viewControllerSpy.handleLoading(_:)
        viewModel.onUserListLoaded = viewControllerSpy.handleUserList(_:)
        viewModel.navigationHandler = coordinatorSpy
        
        return (viewModel, networkMock, viewControllerSpy, coordinatorSpy)
    }
}
