//
//  MainModule.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import UIKit

final class MainModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.register(UINavigationController.self) { resolver in
            UINavigationController(
                rootViewController: resolver.resolve(ListRepositoryViewController.self)
            )
        }
    }

    func getNavigationController() -> UINavigationController {
        return container.resolve(UINavigationController.self)
    }
}
