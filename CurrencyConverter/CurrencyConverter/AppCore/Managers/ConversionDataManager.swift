//
//  ConversionDataManager.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

enum CurrencyDataScheme {
    case source, target
}

class ConversionDataManager {
    
    var sourceCurrency: Currency
    var targetCurrency: Currency
    
    var inputtedRate: Double = 0.0
    
    var isLoaded = MutableProperty(false)
    var isProcessing = MutableProperty(false)
    
    var accessKey: String {
        appConfig.apiAccessKey
    }
    
    let appConfig: ApplicationConfigurable!
    
    // MARK: - Initializer
    init(appConfig: ApplicationConfigurable) {
        self.appConfig = appConfig
        sourceCurrency = CurrencyDTO(name: "US Dollar", code: "USD")
        targetCurrency = CurrencyDTO(name: "Japanese Yen", code: "JPY")
    }
    
    func update(_ scheme: CurrencyDataScheme, with currency: Currency) {
        switch scheme {
        case .source:
            sourceCurrency = currency
        case .target:
            targetCurrency = currency
        }
    }
    
}
