//
//  UIViewController.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

protocol PostAlert {
    
    func postAlert(
        _ title: String,
        message: String,
        buttons: [String],
        handler: ((UIAlertAction,Int) -> Void)?
    )
    
}

extension UIViewController: PostAlert {
    
    func postAlert(
        _ title: String,
        message: String,
        buttons: [String],
        handler: ((UIAlertAction,Int) -> Void)? = nil
    ) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert,
                                      buttons:buttons,
                                      handler: handler)
        
        present(alert, animated: true, completion: nil)
        
    }
}
