//
//  DependencyKey.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

struct DIKey: Hashable, Equatable {
    private let type: Any.Type
    private let name: String?
    private let argumentsType: Any.Type

    init(type: Any.Type, name: String? = nil, argumentsType: Any.Type) {
        self.type = type
        self.name = name
        self.argumentsType = argumentsType
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(name)
        hasher.combine(ObjectIdentifier(argumentsType))
    }

    static func == (lhs: DIKey, rhs: DIKey) -> Bool {
        return lhs.type == rhs.type &&
            lhs.name == rhs.name &&
            lhs.argumentsType == rhs.argumentsType
    }
}
