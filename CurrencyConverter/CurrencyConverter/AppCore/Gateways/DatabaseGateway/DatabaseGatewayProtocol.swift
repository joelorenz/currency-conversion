//
//  DatabaseGatewayProtocol.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol DatabaseCurrencyProtocol {
    
    func store(currencies: [Currency])
    
    func fetchAllCurrencies() -> [Currency]
    
}

protocol DatabaseConvertionRateProtocol {
    
    func storeAllConversionRates(_ rates: [ExchangeRate])
    
    func fetchAllConversionRates() -> [ExchangeRate]
    
    func fetchConvertionRate(for currency: String) -> ExchangeRate?
    
}
