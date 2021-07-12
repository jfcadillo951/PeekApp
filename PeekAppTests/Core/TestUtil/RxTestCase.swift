//
//  RxTestCase.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import XCTest
import RxSwift
import RxTest

class RxTestCase: XCTestCase {

    private let disposeBag = DisposeBag()

    func newObserver<T>(subscribeTo observable: Observable<T>) -> TestableObserver<T> {
        let observer = TestScheduler(initialClock: 0).createObserver(T.self)
        observable.subscribe(observer).disposed(by: disposeBag)
        return observer
    }
}
