//
//  HomeAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class HomeModuleAssembly: Assembly {
    typealias View = HomeController
    typealias ViewModel = HomeViewModel
    typealias Router = HomeRouter
    
    func assemble(container: Container) {
        
        container.register(Router.self) { resolver in
            let router = Router()
            router.rootRouter = resolver.resolve(ApplicationRouter.self)
            router.modulesResolver = resolver
            return router
        }
        
        container.register(View.self) { (resolver) in
            let viewController = View.load(fromStoryBoard: "Main")
            viewController.viewModel = resolver.resolve(ViewModel.self)!
            
            return viewController
        }
        
        container.register(ViewModel.self) { resolver in
            let viewModel = ViewModel()
            viewModel.conversionService = resolver.resolve(ConversionService.self)!
            viewModel.currencyService = resolver.resolve(CurrencyService.self)!
            viewModel.router = resolver.resolve(Router.self)!
            
            return viewModel
        }
    }
}
