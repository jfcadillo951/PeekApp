//
//  Reusable.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}
