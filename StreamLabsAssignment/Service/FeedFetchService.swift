//
//  FeedFetcherService.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation

protocol FeedFetchDelegate: class {
    func feedFetchService(_ service: FeedFetchProtocol, didFetchFeeds feeds: [Feed], withError error: Error?)
}

protocol FeedFetchProtocol: class {
    var delegate: FeedFetchDelegate? { get set }
    func fetchFeeds()
}

class FeedFetcher: FeedFetchProtocol {
    fileprivate let networking: ConnectionProtocol.Type
    weak var delegate: FeedFetchDelegate?
    
    init(networking: ConnectionProtocol.Type = Connection.self) {
        self.networking = networking
    }
    
    
    func fetchFeeds() {
        guard let request = HTTPRequest(url: URL(string: BASE_URL)) else { return }
        networking.makeRequest(request, errorHandler: { [weak self] error in
            guard let serviceSelf = self else {
                return
            }
            serviceSelf.fetchFeedFailed(withError: error)
        }) { [weak self] data, _ in
            guard let serviceSelf = self else {
                return
            }
            serviceSelf.fetchFeedSuccess(withData: data)
        }
    }
    
    
    
    
    fileprivate func fetchFeedFailed(withError error: Error) {
        self.delegate?.feedFetchService(self, didFetchFeeds: [], withError: error)
    }
    
    
    fileprivate func fetchFeedSuccess(withData data: Data) {
        var feeds: [Feed]
        do {
            feeds = try JSONDecoder().decode([Feed].self, from: data)
        } catch {
            feeds = []
        }
        self.delegate?.feedFetchService(self, didFetchFeeds: feeds, withError: nil)
    }
}

