//
//  Error+Extension.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

extension Error {
    func getDomain() -> String {
        return (self as NSError).domain
    }

    func log() {
        #if DEBUG
        print("some error occurred \(localizedDescription)")
        #endif
    }
}
