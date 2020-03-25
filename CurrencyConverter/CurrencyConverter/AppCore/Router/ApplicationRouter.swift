//
//  ApplicationRouter.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class ApplicationRouter: NSObject {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Push/Pop Navigation
    
    /// Show module
    ///
    /// - Parameter viewController: ViewController to show
    func show(viewController: UIViewController,
              animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    /// Close last shown module
    func back(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    // MARK: - Present/Dismiss Modal Presentation
    
    func showModal(viewController: UIViewController, animated: Bool = true) {
        navigationController.present(viewController, animated: animated, completion: nil)
    }
    
    func dismissModal(animated: Bool = true) {
        navigationController.dismiss(animated: animated, completion: nil)
    }
    
}
