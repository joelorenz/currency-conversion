//
//  HomeRouter.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit
import Swinject

class HomeRouter {
    
    // MARK: - @Properties - Injections
    var rootRouter: ApplicationRouter!
    var modulesResolver: Resolver!
    
}

// MARK: - HomeRouterInput
extension HomeRouter: HomeRouterInput {
    
    func showCurrencyPicker(
        scheme: CurrencyDataScheme,
        delegate: CurrencyPickerControllerDelegate
    ) {
        let viewController = modulesResolver.resolve(
            CurrencyPickerController.self,
            arguments: scheme, delegate
        )!
        
        rootRouter.showModal(viewController: viewController)
    }
    
}
