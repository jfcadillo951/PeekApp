//
//  TestableObserver+Extension.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation
import RxTest

extension TestableObserver {

    func getFirstElement() -> Element? {
        return events.first?.value.element
    }

    func getLastElement() -> Element? {
        return events.last?.value.element
    }

    func hasOneEvent() -> Bool {
        return events.count == 1
    }
}
