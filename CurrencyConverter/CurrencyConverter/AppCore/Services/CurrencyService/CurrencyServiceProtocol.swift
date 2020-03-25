//
//  CurrencyServiceProtocol.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol CurrencyServiceProtocol {
    
    func fetchAllCurrencies() -> [Currency]
    
    func search(currency: String) -> [Currency]
    
    func set(currency: Currency, as scheme: CurrencyDataScheme)
    
    func getCurrency(for scheme: CurrencyDataScheme) -> String 
    
}
