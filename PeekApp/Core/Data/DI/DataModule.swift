//
//  DataModule.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

final class DataModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.register(ContentRepository.self) { resolver in
            ContentRepositoryImpl(client: resolver.resolve(Client.self))
        }
    }
}
