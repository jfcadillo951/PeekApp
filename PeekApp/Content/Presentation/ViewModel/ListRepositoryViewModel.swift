//
//  ListRepositoryViewModel.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation
import RxSwift

final class ListRepositoryViewModel {
    private let repository: ContentRepository
    private let mapper: ContentPresentationMapper
    init(repository: ContentRepository,
         mapper: ContentPresentationMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    private enum Constants {
        static let query = "graphql"
        static let page = 50
    }

    private let nextArgsSubject = PublishSubject<UiRepositoryArgs>()
    var nextArgsObserver: Observable<UiRepositoryArgs> {
        nextArgsSubject.asObservable()
    }

    private var currentToken: String?

    func onViewDidLoad() {
        callData()
    }

    private var isCalling = false
    func onLoadNext(hasNext: Bool) {
        if hasNext {
            callData()
        }
    }
}


private extension ListRepositoryViewModel {
    func callData() {
        if isCalling {
            return
        }
        isCalling = true
        repository.searchRepositories(
            query: Constants.query,
            total: Constants.page,
            nextToken: currentToken
        ) { [weak self] value in
            guard let self = self else {return}
            self.isCalling = false
            switch value {
            case .success(let data):
                self.nextArgsSubject.onNext(self.mapper.map(data))
                self.currentToken = data.pageInfo.endCursor
            case .error(_):
                break
            }
        }
    }
}
