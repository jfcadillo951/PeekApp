//
//  UiRepositoryArgsFactory.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation
@testable import PeekApp

extension UiRepositoryArgs {
    static func make(
        items: [UiRepositoryItem] = [UiRepositoryItem.make()],
        hasNext: Bool = true,
        refreshData: Bool = false
    ) -> Self {
        .init(items: items, hasNext: hasNext, refreshData: refreshData)
    }
}
