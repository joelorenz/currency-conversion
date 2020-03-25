//
//  AppDefaults.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct AppDefaults {
    
    @UserDefaultWrapper(key: .isFirstLaunch)
    var isFirsLaunch: Bool?
    
    @UserDefaultWrapper(key: .dateInterval)
    var dateInterval: String?
    
}


