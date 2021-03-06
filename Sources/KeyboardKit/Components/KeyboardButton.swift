//
//  KeyboardButton.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This protocol should be implemented by any view that can be
 used as a keyboard button. Implementing this protocol makes
 it possible to add it to button rows and collection views.
 
 For convenience, you can use the `KeyboardButtonView` class
 instead of implementing this protocol from scratch.
 */
public protocol KeyboardButton: KeyboardButtonRowComponent {
    
    var action: KeyboardAction { get }
    var secondaryAction: KeyboardAction? { get }
}


// MARK: - Animations

public extension KeyboardButton {
    
    func animateStandardPress(factor: CGFloat = 1.18, completion: (() -> ())? = nil) {
        let transform = CGAffineTransform(scaleX: factor, y: factor)
        animateTransform(transform, completion: completion)
    }
    
    func animateStandardRelease(completion: (() -> ())? = nil) {
        animateTransform(.identity, completion: completion)
    }
    
    func animateStandardTap(completion: (() -> ())? = nil) {
        animateStandardPress { [weak self] in
            self?.animateStandardRelease(completion: completion)
        }
    }
}

private extension KeyboardButton {
    
    func animateTransform(_ transform: CGAffineTransform, completion: (() -> ())? = nil) {
        UIView.animate(
            withDuration: 0.123,
            delay: 0,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: { [weak self] in self?.transform = transform },
            completion: { _ in completion?() }
        )
    }
}
