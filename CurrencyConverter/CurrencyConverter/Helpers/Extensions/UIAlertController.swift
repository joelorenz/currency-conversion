//
//  UIAlertController.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func showFromRoot(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        guard let viewController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
            else { return }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    convenience init(
        title: String?,
        message: String?,
        preferredStyle: UIAlertController.Style,
        buttons: [String],
        handler: ((UIAlertAction,Int) -> Void)?
    ) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        
        var buttonIndex = 0
        
        buttons.forEach { (actionTitle) in
            let style: UIAlertAction.Style = buttonIndex == 0 ? .cancel : .default
            
            let action = UIAlertAction(
                title: actionTitle,
                preferredStyle: style,
                buttonIndex: buttonIndex,
                handler: handler
            )
            
            buttonIndex += 1
            self.addAction(action)
        }
    }
}
        

extension UIAlertAction {
    convenience init(title: String?,
                     preferredStyle: UIAlertAction.Style,
                     buttonIndex: Int,
                     handler: ((UIAlertAction,Int) -> Void)?) {
        
        self.init(title: title, style: preferredStyle) { (action: UIAlertAction) in
            if let tapHandler = handler {
                tapHandler(action,buttonIndex)
            }
        }
    }
}
