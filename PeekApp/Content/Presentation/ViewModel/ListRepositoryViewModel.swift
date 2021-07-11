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

    private let errorSubject = PublishSubject<String>()
    var errorObserver: Observable<String> {
        errorSubject.asObservable()
    }

    private var currentToken: String?
    private var isCalling = false
    func onLoadNext(hasNext: Bool) {
        if hasNext {
            callData(pullToRefresh: false)
        }
    }

    func onPullToRefresh() {
        currentToken = nil
        callData(pullToRefresh: true)
    }
}


private extension ListRepositoryViewModel {
    func callData(pullToRefresh: Bool) {
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
                self.currentToken = data.pageInfo.endCursor
                self.nextArgsSubject.onNext(
                    self.mapper.map(data, pullToRefresh: pullToRefresh))
            case .error(_):
                self.errorSubject.onNext("Something where wrong, please try it again later")
            }
        }
    }
}
