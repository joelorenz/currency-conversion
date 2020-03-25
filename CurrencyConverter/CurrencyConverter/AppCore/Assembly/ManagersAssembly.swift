//
//  ManagersAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class ManagersAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RefreshManager.self) { resolver in
            RefreshManager(service: resolver.resolve(ConversionService.self)!)
        }
        .inObjectScope(.container)
        
        container.register(ConversionDataManager.self) { resolver in
            ConversionDataManager(appConfig: resolver.resolve(ApplicationConfigurable.self)!)
        }
        .inObjectScope(.container)
        
    }
    
}
