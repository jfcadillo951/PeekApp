//
//  DependencyResolver.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

public protocol DIResolver {
    func resolve<T>(_ type: T.Type) -> T
    func resolve<T>(_ type: T.Type, _ name: String?) -> T
    func resolve<T, A>(_ type: T.Type, argument: A) -> T
    func resolve<T, A>(_ type: T.Type, _ name: String?, argument: A) -> T
}
