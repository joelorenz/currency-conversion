//
//  MockCurrency.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

@testable import CurrencyConverter

struct MockCurrency: Currency {
    
    let name: String
    let code: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
    
    init(copy obj: Currency) {
        self.name = obj.name
        self.code = obj.code
    }
    
}
