//
//  ExchangeRateDTO.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct ExchangeRateDTO: ExchangeRate {
    
    let currency: String
    let rate: Double
    
    init(currency: String, rate: Double) {
        self.currency = currency
        self.rate = rate
    }
    
    init(copy obj: ExchangeRate) {
        currency = obj.currency
        rate = obj.rate
    }
    
}
