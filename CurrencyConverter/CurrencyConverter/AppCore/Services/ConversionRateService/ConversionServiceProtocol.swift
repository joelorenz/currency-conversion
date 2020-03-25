//
//  ConversionServiceProtocol.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol ConversionServiceProtocol {
    
    func fetchCurrenciesAndRates(completed: CompletionWithErrorClosure?)
    
}

protocol ConversionCalculationServiceProtocol {
    
    func calculate(value: Double) -> NSDecimalNumber
    
    func recalculate(
        withNewCurrency currency: Currency,
        for scheme: CurrencyDataScheme
    ) -> NSDecimalNumber
    
    func swapAndRecalculateRates() -> NSDecimalNumber
    
}

protocol ConversionPickerServiceProtocol {
    
    func getAllRatesSummaryCalculation() -> [CalculationSummary]
    
}
