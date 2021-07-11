//
//  ApiResult+Extension.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Foundation

extension ApiResult {

    func map<R>(_ transform: (T) -> R) -> ApiResult<R> {
        switch self {
        case .success(let data):
            return ApiResult<R>.success(data: transform(data))
        case .error(let error):
            return ApiResult<R>.error(error: error)
        }
    }

    func isEqual(_ result: ApiResult<T>?) -> Bool where T: Equatable {
        switch (self, result) {
        case let (.success(data1), .success(data2)):
            return data1 == data2
        case let (.error(error1), .error(error2)):
            return error1?.getDomain() == error2?.getDomain()
        default:
            return false
        }
    }
}

