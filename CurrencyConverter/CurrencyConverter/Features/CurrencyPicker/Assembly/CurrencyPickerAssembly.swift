//
//  CurrencyPickerAssembly.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import Swinject

class CurrencyPickerAssembly: Assembly {
    typealias View = CurrencyPickerController
    typealias ViewModel = CurrencyPickerViewModel
    typealias Router = CurrencyPickerRouter
    
    func assemble(container: Container) {
        
        container.register(Router.self) { resolver in
            let router = Router()
            router.rootRouter = resolver.resolve(ApplicationRouter.self)
            router.modulesResolver = resolver
            return router
        }
        
        container.register(View.self) {
            (resolver, scheme: CurrencyDataScheme, delegate: CurrencyPickerControllerDelegate) in
            let viewController = View.load(fromStoryBoard: "Main", isInitialController: false)
            
            viewController.viewModel = resolver.resolve(ViewModel.self, argument: scheme)
            viewController.delegate = delegate
            
            return viewController
        }
        
        container.register(ViewModel.self) { (resolver, scheme: CurrencyDataScheme) in
            let viewModel = ViewModel(scheme: scheme)
            
            viewModel.conversionService = resolver.resolve(ConversionService.self)!
            viewModel.router = resolver.resolve(Router.self)
            
            return viewModel
        }
    }
}
