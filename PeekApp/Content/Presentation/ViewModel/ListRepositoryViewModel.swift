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
        static let page = 20
    }

    private let nextArgsSubject = PublishSubject<UiRepositoryArgs>()
    var nextArgsObserver: Observable<UiRepositoryArgs> {
        nextArgsSubject.asObservable()
    }

    private var currentToken: String?

    func onViewDidLoad() {
        callData()
    }

    func onNextPage() {
        callData()
    }
}


private extension ListRepositoryViewModel {
    func callData() {
        repository.searchRepositories(
            query: Constants.query,
            total: Constants.page,
            nextToken: currentToken
        ) { value in
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
