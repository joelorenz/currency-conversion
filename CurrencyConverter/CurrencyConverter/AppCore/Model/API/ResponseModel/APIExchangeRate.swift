//
//  APIExchangeRate.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

class APIExchangeRateResponse: APIModel {
    
    let success: Bool
    let source: String?
    let timestamp: TimeInterval?
    let quotes: [APIExchangeRate]?
    let error: HTTPError?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        success = try container.decode(Bool.self, forKey:  .success)
        source = try? container.decode(String.self, forKey:  .source)
        timestamp = try? container.decode(TimeInterval.self, forKey:  .timestamp)
        
        let rawQuotes = try? container.decode([String: Double].self, forKey: .quotes)
        quotes = rawQuotes?.map { APIExchangeRate(currency: $0.key, rate: $0.value) }
        
        error = try? container.decode(HTTPError.self, forKey: .error)
    }
    
}

extension APIExchangeRateResponse {
    
    enum CodingKeys: String, CodingKey {
        case success, source, timestamp, quotes, error
    }
    
}

struct APIExchangeRate: ExchangeRate, APIModel, Equatable {
    
    let currency: String
    let rate: Double

    init(currency: String, rate: Double) {
        self.currency = currency
        self.rate = rate
    }
    
    init(copy obj: ExchangeRate) {
        currency = obj.currency
        rate = obj.rate
    }
    
}

extension APIExchangeRate {
    
    enum CodingKeys: String, CodingKey {
        case currency, rate
    }
    
}
