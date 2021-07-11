//
//  ContentRepository.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

protocol ContentRepository {
    func searchRepositories(
        query: String,
        total: Int,
        nextToken: String?,
        _ onCompletion: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)
}
