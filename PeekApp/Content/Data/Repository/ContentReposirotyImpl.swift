//
//  ContentReposirotyImpl.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

final class ContentRepositoryImpl: ContentRepository {
    private let client: Client
    init(client: Client) {
        self.client = client
    }
    func searchRepositories(
        query: String,
        total: Int,
        nextToken: String?,
        _ onCompletion: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void) {
        let apolloQuery = SearchRepositoriesQuery(
            query: query,
            count: total,
            token: nextToken)
        client.apollo.fetch(query: apolloQuery) { value in
            switch value {
            case .success(let response):
                guard let data = response.data?.search else {
                    onCompletion(.error(error: ApiError.noElementsFound))
                    return
                }
                onCompletion(.success(data: data))
            case .failure(let error):
                onCompletion(.error(error: error))
            }
        }
    }
}
