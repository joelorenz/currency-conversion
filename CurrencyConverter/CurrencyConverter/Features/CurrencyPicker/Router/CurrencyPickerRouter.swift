//
//  CurrencyPickerRouter.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class CurrencyPickerRouter {
    
    // MARK: - @Properties - Injections
    var rootRouter: ApplicationRouter!
    var modulesResolver: Resolver!
    
}

// MARK: - CurrencyPickerRouterInput
extension CurrencyPickerRouter: CurrencyPickerRouterInput {
    
}
