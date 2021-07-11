//
//  CoreDataFactory.swift
//  PeekAppTests
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation
import Apollo
@testable import PeekApp

enum CoreDataFactory {
    static func getApiSearch() -> SearchRepositoriesQuery.Data.Search? {
        let jsonString = """
            {
                  "__typename": "SearchResultItemConnection",
                  "pageInfo": {
                    "__typename": "PageInfo",
                    "endCursor": "Y3Vyc29yOjE=",
                    "hasNextPage": true
                  },
                  "edges": [
                    {
                      "__typename": "SearchResultItemEdge",
                      "node": {
                        "__typename": "Repository",
                        "name": "graphql",
                        "owner": {
                          "__typename": "Organization",
                          "login": "graphql-go",
                          "avatarUrl": "https://avatars.githubusercontent.com/u/14210643?v=4"
                        },
                        "stargazers": {
                          "__typename": "StargazerConnection",
                          "totalCount": 7793
                        }
                      }
                    }
                  ]
                }
            """
        let data = jsonString.data(using: .utf8)!
        let json = try! JSONSerialization.jsonObject(
            with: data, options: .allowFragments) as! JSONObject
        return try! .init(jsonObject: json)
    }
}


//extension SearchRepositoriesQuery.Data.Search {
//    static func make() -> Self {
//        .init(pageInfo: <#T##PageInfo#>, edges: [
//            .init(node: Edge.Node?)
//        ])
//    }
//}
//
//extension SearchRepositoriesQuery.Data.Search.Edge.Node {
//    init() {
//        self.asRepository = .selections.
//    }
//}
