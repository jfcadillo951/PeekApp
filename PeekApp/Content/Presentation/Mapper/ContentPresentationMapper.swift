//
//  ContentPresentationMapper.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

protocol ContentPresentationMapper {
    func map(_ value: SearchRepositoriesQuery.Data.Search) -> UiRepositoryArgs
}
