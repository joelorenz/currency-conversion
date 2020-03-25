//
//  Tappable.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

protocol Tappable {
    
    func addGestureToView<View: UIView>(
        _ view: View,
        target: AnyObject,
        selector: Selector,
        cancelTouches isCancelled:Bool
    )
    
}

extension Tappable {
    
    func addGestureToView<View: UIView>(
        _ view: View,
        target: AnyObject,
        selector: Selector,
        cancelTouches isCancelled:Bool
    ) {
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        tapGesture.cancelsTouchesInView = isCancelled
        view.addGestureRecognizer(tapGesture)
    }
    
}
