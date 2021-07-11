//
//  ContentModule.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

final class ContentModule {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.register(ListRepositoryViewModel.self) { _ in
            .init()
        }
        container.register(ListRepositoryViewController.self) { resolver in
            .init(viewModel: resolver.resolve(ListRepositoryViewModel.self))
        }
    }
}
