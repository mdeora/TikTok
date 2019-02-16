//
//  UIViewController+Extension.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation
import UIKit



extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}
