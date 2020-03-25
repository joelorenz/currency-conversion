//
//  UserDefaultWrapper+Key.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

// MARK: - Key as RawRepresentable
struct Key: RawRepresentable {
    
    let rawValue: String
    
}

extension Key: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}

// MARK: - Declare Keys
extension Key {
    
    static let isFirstLaunch: Key = "kIsFirstLaunch"
    static let dateInterval: Key = "kDateInterval"
    
}
