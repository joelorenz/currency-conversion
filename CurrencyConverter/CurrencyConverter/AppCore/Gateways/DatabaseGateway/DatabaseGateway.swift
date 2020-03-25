//
//  DatabaseGateway.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation


class DatabaseGateway {
    
}

// MARK: - Conform to RealmCRUDProtocol
extension DatabaseGateway: RealmCRUDProtocol { }


// MARK: - DatabaseCurrencyProtocol
extension DatabaseGateway: DatabaseCurrencyProtocol {
    
    func store(currencies: [Currency]) {
        currencies.forEach { update($0.toRealm()) }
    }
    
    func fetchAllCurrencies() -> [Currency] {
        return getAllEntities(ofType: RealmCurrency.self)?.map { $0.toDTO() } ?? []
    }
    
}

// MARK: - DatabaseConvertionRateProtocol
extension DatabaseGateway: DatabaseConvertionRateProtocol {
    
    func storeAllConversionRates(_ rates: [ExchangeRate]) {
        rates.forEach { update($0.toRealm()) }
    }
    
    func fetchAllConversionRates() -> [ExchangeRate] {
        return getAllEntities(ofType: RealmExchangeRate.self)?.map { $0.toDTO() } ?? []
    }
    
    func fetchConvertionRate(for currency: String) -> ExchangeRate? {
        return getAllEntities(ofType: RealmExchangeRate.self)?
            .first(where: { $0.currency.lowercased() == currency.lowercased() })?
            .toDTO()
    }
    
}
