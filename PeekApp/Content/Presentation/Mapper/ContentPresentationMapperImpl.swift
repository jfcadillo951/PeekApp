//
//  ContentPresentationMapperImpl.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

final class ContentPresentationMapperImpl: ContentPresentationMapper {
    func map(_ value: SearchRepositoriesQuery.Data.Search) -> UiRepositoryArgs {
        .init(
            items: value.edges?.map({ item in
                map(item)
            }) ?? [],
            hasNext: value.pageInfo.endCursor != nil)
    }
}

private extension ContentPresentationMapperImpl {
    func map(_ value: SearchRepositoriesQuery.Data.Search.Edge?) -> UiRepositoryItem {
        .init(
            name: value?.node?.asRepository?.fragments.repositoryDetails.name ?? "",
            ownerName: "",
            ownerAvater: "",
            numberOfStars: "")
    }
}
