//
//  ServerProtocols.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

// MARK: - Currency
protocol ServerCurrencyProtocol {
    
    func fetchAllCurrencies<Value: APICurrencyResponse>() -> SignalProducer<Value, HTTPError>
    
}

// MARK: - Conversion Rates
protocol ServerConversionRateProtocol {
    
    func fetchConversionRates<Value: APIExchangeRateResponse>(
        _ params: APIConversionRateRequestModel
    ) -> SignalProducer<Value, HTTPError>
    
}
