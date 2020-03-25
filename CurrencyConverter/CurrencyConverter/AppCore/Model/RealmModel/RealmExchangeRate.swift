//
//  RealmExchangeRate.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import RealmSwift

class RealmExchangeRate: Object, ExchangeRate {
    
    @objc dynamic var currency = ""
    @objc dynamic var rate = 0.0
    
    override class func primaryKey() -> String? {
        return "currency"
    }
    
    required init() { }
    
    required init(copy obj: ExchangeRate) {
        currency = obj.currency
        rate = obj.rate
    }
    
}
