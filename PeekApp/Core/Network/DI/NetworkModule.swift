//
//  NetworkModule.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

final class NetworkModule {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.register(Client.self, nil, .container) { _ in // Singleton DI
            .shared
        }
    }
}
