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
        container.register(ContentRepository.self) { resolver in
            ContentRepositoryImpl(client: resolver.resolve(Client.self))
        }
        container.register(ContentPresentationMapper.self) { _ in
            ContentPresentationMapperImpl()
        }
        container.register(ListRepositoryViewModel.self) { resolver in
            .init(
                repository: resolver.resolve(ContentRepository.self),
                mapper: resolver.resolve(ContentPresentationMapper.self)
            )
        }
        container.register(ListRepositoryViewController.self) { resolver in
            .init(viewModel: resolver.resolve(ListRepositoryViewModel.self))
        }
    }
}
