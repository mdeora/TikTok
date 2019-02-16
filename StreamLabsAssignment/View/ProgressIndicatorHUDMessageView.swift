//
//  ProgressIndicatorHUDMessageView.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation
import UIKit

class ProgressIndicatorHUDMessageView: UIView {
    static let tag = 9999
    
    var message: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ProgressIndicatorHUDMessageView {
    func configure() {
        tag = ProgressIndicatorHUDView.tag
        backgroundColor = UIColor.gray
        clipsToBounds = true
        layer.cornerRadius = 10
    }
}

extension ProgressIndicatorHUDMessageView {
    func addToView(_ view: UIView, withMessage message: String) {
        let size = CGSize(width: view.bounds.size.width * 2 / 3, height: 100)
        let origin = CGPoint(
            x: view.frame.width / 2 - size.width / 2,
            y: view.frame.height / 2 - size.height / 2
        )
        frame = CGRect(origin: origin, size: size)
        addMessageLabel(message)
        view.addSubview(self)
    }
    
    func hideView(afterDelay delay: TimeInterval, completionBlock: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let `self` = self else {
                return
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = 0
            }) { isComplete in
                if isComplete {
                    self.removeFromSuperview()
                    completionBlock()
                }
            }
        }
    }
    
}

extension ProgressIndicatorHUDMessageView {
    fileprivate func addMessageLabel(_ message: String) {
        let offset: CGFloat = 10
        let messageFrame = CGRect(
            x: offset, y: offset,
            width: bounds.size.width - offset * 2,
            height: bounds.size.height - offset * 2
        )
        let messageLabel = UILabel(frame: messageFrame)
        messageLabel.text = message
        messageLabel.textColor = UIColor.white
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        messageLabel.lineBreakMode = .byWordWrapping
        addSubview(messageLabel)
    }
}
