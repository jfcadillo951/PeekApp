//
//  Injection.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation
import UIKit

final class Injection {

    static let shared = Injection()

    private let container = Container()
    private let mainModule: MainModule

    private init() {
        mainModule = .init(container)
        injectDependencies()
    }

    private func injectDependencies() {
        NetworkModule(container).inject()
        DataModule(container).inject()
        mainModule.inject()
    }

    func getNavigationController() -> UINavigationController {
        mainModule.getNavigationController()
    }

}
