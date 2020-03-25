//
//  APIMethods.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

enum ApiMethod: String {
    
    case getAllCurrencies = "list"
    case getConversionRates = "live"
    
    var baseURLType: BaseURLType {
        switch self {
        default:
            return BaseURLType.default
        }
    }
    
}
