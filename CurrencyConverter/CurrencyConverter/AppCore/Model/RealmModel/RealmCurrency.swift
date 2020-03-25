//
//  RealmCurrency.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCurrency: Object, Currency {
    
    @objc dynamic var name = ""
    @objc dynamic var code = ""
    
    override class func primaryKey() -> String? {
        return "code"
    }
    
    required init() { }
    
    required init(copy obj: Currency) {
        name = obj.name
        code = obj.code
    }
    
}
