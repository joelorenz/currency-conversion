//
//  SotryboardLoadable.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

/// Add method to load viewController from storyboard
protocol StoryboardLoadable: class {

    static func load(fromStoryBoard name: String, isInitialController: Bool) -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    
    static func load(fromStoryBoard name: String = "", isInitialController: Bool = true) -> Self {
        let _name = name.isEmpty ? String(describing: Self.self) : name
        
        let storyboard = UIStoryboard(name: _name, bundle: nil)
        
        guard !isInitialController else {
            guard let viewController = storyboard.instantiateInitialViewController() as? Self
                else { fatalError("Error: Unable to load \(name) from storyboard") }
            
            return viewController
        }
        
        let strViewController = String(describing: Self.self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: strViewController) as? Self
            else { fatalError("Error: Unable to load \(strViewController) from storyboard \(name)") }
        
        return viewController
    }
    
}
