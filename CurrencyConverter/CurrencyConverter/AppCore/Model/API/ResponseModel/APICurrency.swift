//
//  APICurrency.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

class APICurrencyResponse: APIModel {
    
    let success: Bool
    let currencies: [APICurrency]
    let error: HTTPError?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        success = try container.decode(Bool.self, forKey:  .success)
        
        let rawCurrencies = try container.decode([String: String].self, forKey: .currencies)
        currencies = rawCurrencies.map { APICurrency(name: $0.value, code: $0.key) }
        
        error = try? container.decode(HTTPError.self, forKey: .error)
    }
    
}

extension APICurrencyResponse {
    
    enum CodingKeys: String, CodingKey {
        case success, currencies, error
    }
    
}

struct APICurrency: Currency, APIModel, Equatable {
    
    let name: String
    let code: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
    
    init(copy obj: Currency) {
        name = obj.name
        code = obj.code
    }
    
}

extension APICurrency {
    
    enum CodingKeys: String, CodingKey {
        case name, code
    }
    
}
