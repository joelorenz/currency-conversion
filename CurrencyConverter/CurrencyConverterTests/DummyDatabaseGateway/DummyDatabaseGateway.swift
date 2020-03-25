//
//  DummyDatabaseGateway.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/25/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

@testable import CurrencyConverter

struct DummyDatabaseGateway {
    
}

// MARK: - DatabaseCurrencyProtocol
extension DummyDatabaseGateway: DatabaseCurrencyProtocol {
    
    func store(currencies: [Currency]) { }
    
    func fetchAllCurrencies() -> [Currency] {
        return MockModelGenerator().currencies
    }
    
}

// MARK: - DatabaseCurrencyProtocol
extension DummyDatabaseGateway: DatabaseConvertionRateProtocol {
    
    func storeAllConversionRates(_ rates: [ExchangeRate]) { }
    
    func fetchAllConversionRates() -> [ExchangeRate] {
        return MockModelGenerator().exchangeRate
    }
    
    func fetchConvertionRate(for currency: String) -> ExchangeRate? {
        return fetchAllConversionRates().first(where: {
            $0.currency.lowercased() == currency.lowercased()
        })
    }
    
}
