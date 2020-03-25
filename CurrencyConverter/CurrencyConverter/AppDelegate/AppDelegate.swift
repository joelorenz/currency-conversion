//
//  AppDelegate.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit
import Swinject
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var applicationAssembler: Assembler!
    var applicationRouter: ApplicationRouter!
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        resolveDependencies()
        setupWindow()
        
        loadInitialData()
        
        print("Realm --- > \(Realm.Configuration.defaultConfiguration.fileURL!)")
        
        return true
    }
    
    // MARK: - Enable AppState Restoration
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
}

// MARK: - Configurations
private extension AppDelegate {
    
    /// Setup Appearance
    func setupAppearance() {
        
    }
    
    /// Connect modules and services
    func resolveDependencies() {
        
        let applicationConfigAssembler  = Assembler([ApplicationConfigAssembly()])
        let gatewaysAssembler = Assembler([GatewaysAssembly()], parent: applicationConfigAssembler)
        let managersAssembler = Assembler([ManagersAssembly()], parent: gatewaysAssembler)
        let servicesAssembler = Assembler([ServicesAssembly()], parent: managersAssembler)
        
        let modulesAssembler = Assembler([HomeModuleAssembly(),
                                          CurrencyPickerAssembly()], parent: servicesAssembler)
        
        self.applicationAssembler = Assembler([ApplicationAssembly()], parent: modulesAssembler)
        
    }
    
    /// Setup main window
    func setupWindow() {
        
        window = applicationAssembler.resolver.resolve(UIWindow.self)
        window?.makeKeyAndVisible()
        applicationRouter = applicationAssembler.resolver.resolve(ApplicationRouter.self)
        
        window?.restorationIdentifier = "AppWindow"
        
    }
    
    /// Load initial data after app launches.
    func loadInitialData() {
        let refreshManager = applicationAssembler.resolver.resolve(RefreshManager.self)!
        
        refreshManager.loadAllData()
    }
}
