//
//  Client.swift
//  PeekApp
//
//  Created by Josué Cadillo on 10-07-21.
//

import Foundation
import Apollo

final class Client {
    static let shared = Client()
    private let token = "<<YOUR TOKEN>>"
    private let url = "https://api.github.com/graphql"
    lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let network = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(store: store),
            endpointURL: URL(string: url)!,
            additionalHeaders: [
                "Authorization": "Bearer \(token)"
            ]
        )
        return .init(networkTransport: network, store: store)
    }()
}
