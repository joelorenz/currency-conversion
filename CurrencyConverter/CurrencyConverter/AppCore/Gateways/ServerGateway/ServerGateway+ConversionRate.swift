//
//  ServerGateway+ConversionRate.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

// MARK: - ServerConversionRateProtocol
extension ServerGateway: ServerConversionRateProtocol {
    
    func fetchConversionRates<Value: APIExchangeRateResponse>(
        _ params: APIConversionRateRequestModel
    ) -> SignalProducer<Value, HTTPError> {
        let method = ApiMethod.getConversionRates
        guard let uriDetails = apiClient.getURIDetails(apiMethod: method)
            else { return errorNilSignal() }
        
        return signalProducer(
            baseURL: method.baseURLType,
            uri: uriDetails,
            params: params.dictionary()
        )
    }
}
