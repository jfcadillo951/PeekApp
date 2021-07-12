//
//  ListRepositoryViewModelTests.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import XCTest
@testable import PeekApp
import Cuckoo

final class ListRepositoryViewModelTests: RxTestCase {

    private var viewModel: ListRepositoryViewModel!
    private let mapper = MockContentPresentationMapper()
    private let repository = MockContentRepository()

    override func setUpWithError() throws {
        viewModel = .init(repository: repository, mapper: mapper)
        stub(mapper) { stub in
            when(
                stub.map(any(), pullToRefresh: any())
            ).thenReturn(UiRepositoryArgs.make())
        }
        stub(repository) { stub in
            when(
                stub.searchRepositories(
                    query: any(),
                    total: any(),
                    nextToken: any(),
                    any())
            ).thenDoNothing()
        }
    }

    func test_onLoadNext_onSuccess() throws {
        // Arrange
        let observer = newObserver(subscribeTo: viewModel.nextArgsObserver)
        let expected = UiRepositoryArgs.make()
        let captor = ArgumentCaptor<(ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void>()
        // Act
        viewModel.onLoadNext(hasNext: true)
        // Assert
        verify(repository)
            .searchRepositories(
                query: any(),
                total: any(),
                nextToken: any(),
                captor.capture())
        captor.value?(.success(data: CoreDataFactory.getApiSearch()!))
        XCTAssert(observer.getLastElement() == expected)
    }

    func test_onLoadNext_onError() throws {
        // Arrange
        let observer = newObserver(subscribeTo: viewModel.errorObserver)
        let expected = "Something where wrong, please try it again later"
        let captor = ArgumentCaptor<(ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void>()
        // Act
        viewModel.onLoadNext(hasNext: true)
        // Assert
        verify(repository)
            .searchRepositories(
                query: any(),
                total: any(),
                nextToken: any(),
                captor.capture())
        captor.value?(.error(error: nil))
        XCTAssert(observer.getLastElement() == expected)
    }
}
