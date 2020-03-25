//
//  MockExchangeRate.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

@testable import CurrencyConverter

struct MockExchangeRate: ExchangeRate {
    
    let currency: String
    let rate: Double
    
    init(currency: String, rate: Double) {
        self.currency = currency
        self.rate = rate
    }
    
    init(copy obj: ExchangeRate) {
        self.currency = obj.currency
        self.rate = obj.rate
    }
    
}
