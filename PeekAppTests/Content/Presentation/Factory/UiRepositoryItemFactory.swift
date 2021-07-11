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
        name: String = "Name: Test",
        ownerName: String = "Owner: Owner",
        ownerAvatar: String = "https://www.google.com",
        numberOfStars: String = "10 Stars",
        year: String = UUID().uuidString,
        date: Date = Date()
    ) -> Self {
        .init(
            name: name,
            ownerName: ownerName,
            ownerAvatar: ownerAvatar,
            numberOfStars: numberOfStars)
    }
}
