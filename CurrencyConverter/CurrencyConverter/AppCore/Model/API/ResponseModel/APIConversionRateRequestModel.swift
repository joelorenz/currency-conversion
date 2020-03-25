//
//  APIConversionRateRequestModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct APIConversionRateRequestModel: APIModel {
    
    let accessKey: String
    let source: String
    let currencies: String
    let format: String
    
    init(accessKey: String, source: String, currencies: [String], format: String = "1") {
        self.accessKey = accessKey
        self.source = source
        self.currencies = currencies.joined(separator: ",")
        self.format = format
    }
}

extension APIConversionRateRequestModel {
    
    enum CodingKeys: String, CodingKey {
        case source, currencies, format
        case accessKey = "access_key"
    }
    
}
