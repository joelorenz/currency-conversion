//
//  ApplicationAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class ApplicationAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UINavigationController.self) { _ in
            return self.buildRootNavigationController()
        }
        .inObjectScope(.container)
        .initCompleted { resolver, controller in
            controller.addChild(resolver.resolve(HomeController.self)!)
        }
        
        container.register(ApplicationRouter.self) { resolver in
            ApplicationRouter(navigationController:
                resolver.resolve(UINavigationController.self)!)
        }
        .inObjectScope(.container)
        
        container.register(UIWindow.self) { resolver in
            let navigationController = resolver.resolve(UINavigationController.self)!
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = navigationController
            
            return window
        }
        .inObjectScope(.container)
    }
    
}

// MARK: - Private Methods methods
extension ApplicationAssembly {
    
    fileprivate func buildRootNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.restorationIdentifier = "MainNavigationController"
        
        return navigationController
    }
    
}
