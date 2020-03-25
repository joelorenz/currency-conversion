//
//  ApplicationConfigAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class ApplicationConfigAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ApplicationConfigurable.self) { _ in
            return AppConfig()
        }
        .inObjectScope(.container)
    }
    
}
