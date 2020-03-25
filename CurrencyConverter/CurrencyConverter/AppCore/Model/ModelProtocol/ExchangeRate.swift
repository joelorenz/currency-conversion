//
//  ExchangeRate.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol ExchangeRate {
    
    var currency: String { get }
    var rate: Double { get }
    
    init(copy obj: ExchangeRate)
}

extension ExchangeRate {
    
    func toDTO() -> ExchangeRateDTO {
        return ExchangeRateDTO(copy: self)
    }
    
    func toRealm() -> RealmExchangeRate {
        return RealmExchangeRate(copy: self)
    }
    
    func toAPIModel() -> APIExchangeRate {
        return APIExchangeRate(copy: self)
    }
}
