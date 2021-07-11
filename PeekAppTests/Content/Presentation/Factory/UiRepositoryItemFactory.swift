//
//  UiRepositoryItemFactory.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation
@testable import PeekApp

extension UiRepositoryItem {
    static func make(
        name: String = "Test",
        ownerName: String = "Owner",
        ownerAvatar: String = "https://www.google.com",
        numberOfStars: String = "10 stars",
        year: String = UUID().uuidString,
        date: Date = Date()
    ) -> Self {
        .init(
            name: name,
            ownerName: ownerName,
            ownerAvater: ownerAvatar,
            numberOfStars: numberOfStars)
    }
}
