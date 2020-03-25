//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

class CurrencyService {
    
    // MARK: - @Properties - Injections
    var databaseGateway: DatabaseCurrencyProtocol!
    var dataManager: ConversionDataManager! {
        didSet {
            
        }
    }
    
    // MARK: - @Properties - Private
    private var currencies = [Currency]()
    
    // MARK: - Initializer
    init() { }
}

// MARK: - CurrencyServiceProtocol
extension CurrencyService: CurrencyServiceProtocol {
    
    func fetchAllCurrencies() -> [Currency] {
        return currencies
    }
    
    func search(currency searchText: String) -> [Currency] {
        guard !searchText.isEmpty else { return currencies }
        
        return currencies.filter { currency($0, contains: searchText) }
    }
    
    func set(currency: Currency, as scheme: CurrencyDataScheme) {
        dataManager.update(scheme, with: currency)
    }
    
    func getCurrency(for scheme: CurrencyDataScheme) -> String {
        switch scheme {
        case .source:
            return dataManager.sourceCurrency.code
        case .target:
            return dataManager.targetCurrency.code
        }
    }
    
}

// MARK: - Private Methods Method
private extension CurrencyService {
    
    func setup() {
        currencies = databaseGateway.fetchAllCurrencies()
    }
    
    func currency(
        _ currency: Currency,
        contains searchString: String
    ) -> Bool {
        return currency.name.lowercased().contains(searchString) ||
               currency.code.lowercased().contains(searchString)
    }
    
}
