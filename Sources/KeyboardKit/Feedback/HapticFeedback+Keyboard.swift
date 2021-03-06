//
//  HapticFeedback+Keyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-30.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

public extension HapticFeedback {

    /**
     The standard haptic feedback for a button tap.
     */
    static var standardTapFeedback: HapticFeedback {
        return .mediumImpact
    }
    
    /**
     The standard haptic feedback for a button long press.
    */
    static var standardLongPressFeedback: HapticFeedback {
        return .heavyImpact
    }
}
