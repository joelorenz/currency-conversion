//
//  CurrencyPickerCellViewModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct CurrencyPickerCellViewModel {
    
    private(set) var currencyCode: String
    private(set) var currencyName: String
    private(set) var convertedValue: String = ""
    private(set) var info: String = ""
    
    init(summary: CalculationSummary) {
        currencyCode = summary.target.code
        currencyName = summary.target.name
        convertedValue = summary.info.result
        info = "\(summary.target.code) \(summary.info.base) - \(summary.source.code) 1"
    }
    
}
