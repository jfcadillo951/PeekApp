//
//  String+Extension.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

extension Optional where Wrapped == String {
    func valueOrEmpty() -> String {
        self ?? ""
    }
}
