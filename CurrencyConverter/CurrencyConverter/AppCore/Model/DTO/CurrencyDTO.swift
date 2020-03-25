//
//  CurrencyDTO.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct CurrencyDTO: Currency {
    
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
