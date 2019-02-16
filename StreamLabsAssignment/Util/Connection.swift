//
//  Connection.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation

protocol ConnectionProtocol {
    static func makeRequest(_ request: HTTPRequest, errorHandler: @escaping (Error) -> Void, successHandler: @escaping (Data, HTTPURLResponse) -> Void)
}




struct Connection: ConnectionProtocol {
    static func makeRequest(_ request: HTTPRequest, errorHandler: @escaping (Error) -> Void, successHandler: @escaping (Data, HTTPURLResponse) -> Void) {
        let session = URLSession.shared
        let requestTask = session.dataTask(with: request.buildURLRequest()) { data, response, error in
            DispatchQueue.main.async {
                if let requestError = error {
                    errorHandler(requestError)
                }
                guard let requestData = data, let requestResponse = response as? HTTPURLResponse else {
                    errorHandler(HTTPError.failureParsingHTTPResponse)
                    return
                }
                successHandler(requestData, requestResponse)
            }
        }
        requestTask.resume()
    }
}
