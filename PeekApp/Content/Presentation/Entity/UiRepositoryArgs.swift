//
//  UiRepositoryArgs.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

struct UiRepositoryArgs: Equatable {
    let items: [UiRepositoryItem]
    let hasNext: Bool
    let refreshData: Bool
}
