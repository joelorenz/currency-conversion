//
//  MockModelGenerator.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

@testable import CurrencyConverter

struct MockModelGenerator {
    
    var currencies: [Currency] {
        return [
            MockCurrency(name: "United States Dollar", code: "USD"),
            MockCurrency(name: "Japanese Yen", code: "JPY"),
            MockCurrency(name: "Singapore Dollar", code: "SGD"),
            MockCurrency(name: "Philippine Peso", code: "PHP")
        ]
    }
    
    var exchangeRate: [ExchangeRate] {
        return [
            MockExchangeRate(currency: "USD", rate: 1),
            MockExchangeRate(currency: "JPY", rate: 111.477496),
            MockExchangeRate(currency: "SGD", rate: 1.46263),
            MockExchangeRate(currency: "PHP", rate: 51.205498)
        ]
    }
    
}
