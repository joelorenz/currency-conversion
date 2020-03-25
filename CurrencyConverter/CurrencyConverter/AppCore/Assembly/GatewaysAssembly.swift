//
//  GatewaysAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class GatewaysAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(APIClient.self) { resolver in
            return LocalURLSession(appConfig: resolver.resolve(ApplicationConfigurable.self)!)
        }
        .inObjectScope(.weak)
        
        container.register(ServerGateway.self) { resolver in
            return ServerGateway(apiClient: resolver.resolve(APIClient.self)!)
        }
        .inObjectScope(.weak)
        
        container.register(DatabaseGateway.self) { _ in
            return DatabaseGateway()
        }
        .inObjectScope(.weak)
        
    }
}
