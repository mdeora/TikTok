//
//  HTTPError.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation

enum HTTPError: Error {
    case failureParsingHTTPResponse
}

extension HTTPError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failureParsingHTTPResponse:
            return "Error parsing HTTPResponse."
        }
    }
}
