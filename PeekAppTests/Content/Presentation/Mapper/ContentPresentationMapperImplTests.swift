//
//  ContentPresentationMapperImplTests.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import XCTest
@testable import PeekApp

final class ContentPresentationMapperImplTests: XCTestCase {

    private var mapper: ContentPresentationMapperImpl!

    override func setUpWithError() throws {
        mapper = .init()
    }

    override func tearDownWithError() throws {
    }

    func test_map_notPullToRefresh() throws {
        // Arrange
        let element = CoreDataFactory.getApiSearch()!
        let expected = UiRepositoryArgs.make()
        // Act
        let value = mapper.map(element, pullToRefresh: false)
        // Assert
        XCTAssertEqual(value, expected)
    }

    func test_map_pullToRefresh() throws {
        // Arrange
        let element = CoreDataFactory.getApiSearch()!
        let expected = UiRepositoryArgs.make(refreshData: true)
        // Act
        let value = mapper.map(element, pullToRefresh: true)
        // Assert
        XCTAssertEqual(value, expected)
    }
}
