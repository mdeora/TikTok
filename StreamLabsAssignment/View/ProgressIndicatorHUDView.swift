//
//  ProgressIndicatorHUDView.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation
import UIKit

class ProgressIndicatorHUDView: UIView {
    
    fileprivate var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init() {
        let hudFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 80, height: 80))
        self.init(frame: hudFrame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ProgressIndicatorHUDView {
    static let tag = 9999
    
    func configure() {
        tag = ProgressIndicatorHUDView.tag
        backgroundColor = UIColor.black
        clipsToBounds = true
        layer.cornerRadius = 10
        
        activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.frame.origin = CGPoint(
            x: frame.width / 2 - activityIndicator.frame.width / 2,
            y: frame.height / 2 - activityIndicator.frame.height / 2
        )
        addSubview(activityIndicator)
    }
}

extension ProgressIndicatorHUDView {
    var isLoading: Bool {
        return activityIndicator.isAnimating
    }
    
    func addToView(_ view: UIView) {
        frame.origin = CGPoint(
            x: view.frame.width / 2 - frame.width / 2,
            y: view.frame.height / 2 - frame.height / 2
        )
        view.addSubview(self)
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        removeFromSuperview()
    }
}
