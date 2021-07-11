//
//  ApiResult.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

enum ApiResult<T> {
    case success(data: T)
    case error(error: Error?)
}
