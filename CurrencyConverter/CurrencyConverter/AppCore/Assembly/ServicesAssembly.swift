//
//  ServicesAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class ServicesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(CurrencyService.self) { resolver in
            let service = CurrencyService()
            service.databaseGateway = resolver.resolve(DatabaseGateway.self)!
            service.dataManager = resolver.resolve(ConversionDataManager.self)!
            
            return service
        }
        .inObjectScope(.weak)
        
        container.register(ConversionService.self) { resolver in
            let service = ConversionService()
            service.serverGateway = resolver.resolve(ServerGateway.self)!
            service.databaseGateway = resolver.resolve(DatabaseGateway.self)!
            service.dataManager = resolver.resolve(ConversionDataManager.self)!
            
            return service
        }
        .inObjectScope(.weak)
        
    }
    
}
