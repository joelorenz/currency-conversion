//
//  ServerGateway+Currency.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

// MARK: - ServerCurrencyProtocol
extension ServerGateway: ServerCurrencyProtocol {
    
    func fetchAllCurrencies<Value: APICurrencyResponse>() -> SignalProducer<Value, HTTPError> {
        let method = ApiMethod.getAllCurrencies
        guard let uriDetails = apiClient.getURIDetails(apiMethod: method)
            else { return errorNilSignal() }
        
        return signalProducer(
            baseURL: method.baseURLType,
            uri: uriDetails,
            params: ["access_key": apiClient.appConfig.apiAccessKey]
        )
    }
    
}
