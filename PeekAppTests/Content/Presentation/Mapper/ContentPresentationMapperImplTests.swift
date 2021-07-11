//
//  ContentPresentationMapperImplTests.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import XCTest
@testable import PeekApp

final class ContentPresentationMapperImplTests: XCTestCase {

    var mapper: ContentPresentationMapperImpl!

    override func setUpWithError() throws {
        mapper = .init()
    }

    override func tearDownWithError() throws {
    }

    func test_map_onNotPullToRefresh() throws {
        // Arrange
        let element = CoreDataFactory.getApiSearch()!
        let expected = UiRepositoryArgs.make()
        // Act
        let value = mapper.map(element, pullToRefresh: false)
        // Assert
        XCTAssertEqual(value, expected)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
