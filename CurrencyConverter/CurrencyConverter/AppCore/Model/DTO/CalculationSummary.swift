//
//  CalculationSummary.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct CalculationSummary {
    
    private(set) var source: Currency
    private(set) var target: Currency
    private(set) var info: ConversionAmountInfo
    
    init() {
        source = CurrencyDTO(name: "", code: "")
        target = CurrencyDTO(name: "", code: "")
        info = ("", "")
    }
    
    init(source: Currency, target: Currency, info: ConversionAmountInfo) {
        self.source = source
        self.target = target
        self.info = info
    }
    
    func targetCurrency(contains text: String) -> Bool {
        let string = text.lowercased()
        
        return target.name.lowercased().contains(string) ||
               target.code.lowercased().contains(string)
    }
}
