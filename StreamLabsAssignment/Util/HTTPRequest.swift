//
//  HTTPRequest.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation


enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol HTTPRequestProtocol {
    func buildURLRequest() -> URLRequest
}


struct HTTPRequest: HTTPRequestProtocol {
    fileprivate(set) var url: URL
    fileprivate(set) var method: HTTPRequestMethod
    fileprivate(set) var headers: [String : String]?
    fileprivate(set) var body: [String : AnyObject]?
    
    init?(url: URL?, method: HTTPRequestMethod = .get, headers: [String : String]? = nil, body: [String : AnyObject]? = nil) {
        guard let validURL = url else { return nil }
        self.url = validURL
        self.method = method
        self.headers = headers
        self.body = body
    }
}

extension HTTPRequest {
    func buildURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = parseBody()
        return request
    }
}

extension HTTPRequest {
    fileprivate func parseBody() -> Data? {
        guard let bodyParams = body else { return nil }
        return try? JSONSerialization.data(withJSONObject: bodyParams, options: [])
    }
}
