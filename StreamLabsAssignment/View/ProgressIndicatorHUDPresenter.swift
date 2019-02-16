//
//  ProgressIndicatorHUDPresenter.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation
import UIKit

protocol ProgressIndicatorHUDPresenter {
    var view: UIView! { get }
    func startLoading()
    func stopLoading()
    func showMessage(_ message: String)
    func showMessage(_ message: String, delay: TimeInterval)
}

extension ProgressIndicatorHUDPresenter {
    func startLoading() {
        InteractionUtil.pauseUserInteraction()
        hud.startLoading()
    }
    
    func stopLoading() {
        InteractionUtil.resumeUserInteraction()
        hud.stopLoading()
    }
    
    func showMessage(_ message: String, delay: TimeInterval) {
        InteractionUtil.pauseUserInteraction()
        let hud = hudMessage(message)
        hud.hideView(afterDelay: delay) {
            InteractionUtil.resumeUserInteraction()
        }
    }
    
    func showMessage(_ message: String) {
        showMessage(message, delay: 2.0)
    }
}

extension ProgressIndicatorHUDPresenter {
    
    fileprivate var hud: ProgressIndicatorHUDView {
        if let hud: ProgressIndicatorHUDView = getHUD(withTag: ProgressIndicatorHUDView.tag) {
            return hud
        }
        let hudView = ProgressIndicatorHUDView()
        hudView.addToView(view)
        return hudView
    }
    
    fileprivate func hudMessage(_ message: String) -> ProgressIndicatorHUDMessageView {
        if let hud: ProgressIndicatorHUDMessageView = getHUD(withTag: ProgressIndicatorHUDMessageView.tag) {
            return hud
        }
        let hudMessageView = ProgressIndicatorHUDMessageView()
        hudMessageView.addToView(view, withMessage: message)
        return hudMessageView
    }
    
    fileprivate func getHUD<T>(withTag tag: Int) -> T? {
        return view.viewWithTag(ProgressIndicatorHUDView.tag) as? T
    }
    
}
