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
            debugPrint(value)
        }
    }
}
