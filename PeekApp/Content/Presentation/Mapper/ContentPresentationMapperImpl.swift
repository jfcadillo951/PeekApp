//
//  ContentPresentationMapperImpl.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

final class ContentPresentationMapperImpl: ContentPresentationMapper {
    func map(
        _ value: SearchRepositoriesQuery.Data.Search,
        pullToRefresh: Bool
    ) -> UiRepositoryArgs {
        .init(
            items: value.edges?.map({ item in
                map(item)
            }) ?? [],
            hasNext: value.pageInfo.hasNextPage,
            refreshData: pullToRefresh)
    }
}

private extension ContentPresentationMapperImpl {
    func map(_ value: SearchRepositoriesQuery.Data.Search.Edge?) -> UiRepositoryItem {
        var name = ""
        if let value = value?.node?.asRepository?.fragments.repositoryDetails.name {
            name = "Name: \(value)"
        }
        var owner = ""
        if let value = value?.node?.asRepository?.fragments.repositoryDetails.owner.login {
            owner = "Owner: \(value)"
        }
        var stars = ""
        if let value = value?.node?.asRepository?.fragments.repositoryDetails.stargazers.totalCount {
            stars = "\(value) Stars"
        }
        return .init(
            name: name,
            ownerName: owner,
            ownerAvater: value?.node?.asRepository?.fragments.repositoryDetails.owner.avatarUrl ?? "",
            numberOfStars: stars)
    }
}
