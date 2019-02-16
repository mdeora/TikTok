//
//  InteractionUtil.swift
//  StreamLabsAssignment
//
//  Created by Jude on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import Foundation
import UIKit

struct InteractionUtil {
    
    static func pauseUserInteraction() {
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    static func resumeUserInteraction() {
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
