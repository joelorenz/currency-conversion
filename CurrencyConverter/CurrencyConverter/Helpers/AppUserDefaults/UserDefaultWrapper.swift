//
//  UserDefaultWrapper.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

// MARK: - UserDefaults Wrapper
@propertyWrapper
struct UserDefaultWrapper<Value: PropertyListValue> {
    
    let key: Key

    var wrappedValue: Value? {
        get { UserDefaults.standard.value(forKey: key.rawValue) as? Value }
        set { UserDefaults.standard.set(newValue, forKey: key.rawValue) }
    }
    
}
