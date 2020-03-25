//
//  ConversionService.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

class ConversionService {
    typealias ServerGateway = (ServerCurrencyProtocol & ServerConversionRateProtocol)
    typealias DatabaseGateway = (DatabaseCurrencyProtocol & DatabaseConvertionRateProtocol)
    
    // MARK: - @Properties - Injections
    var serverGateway: ServerGateway!
    var databaseGateway: DatabaseGateway!
    var dataManager: ConversionDataManager!
    
    // MARK: - Initializer
    init() {
        
    }
    
}

// MARK: - ConversionServiceProtocol
extension ConversionService: ConversionServiceProtocol {
    
    func fetchCurrenciesAndRates(completed: CompletionWithErrorClosure?) {
        
        // Since we are using a free subscription,
        // the source currency is only limited to USD
        let sourceCurrency = Constants.DefaultSourceCurrency
        
        let requestModel = APIConversionRateRequestModel(
            accessKey: dataManager.accessKey,
            source: sourceCurrency,
            currencies: []
        )
        
        SignalProducer.combineLatest(
            serverGateway.fetchAllCurrencies(),
            serverGateway.fetchConversionRates(requestModel)
        ).on(starting: { [weak self] in
            guard let self = self else { return }
            self.dataManager.isProcessing.value = true
        }).startWithResult { [weak self] (result) in
            guard let self = self else { return }
            self.dataManager.isProcessing.value = false
            
            switch result {
            case let .failure(error):
                self.dataManager.isLoaded.value = false
                completed?(error)
            case let .success(currencyResponse, conversionRateResponse):
                let quotes = conversionRateResponse.quotes ?? []
                
                let isNotEmpty = !(currencyResponse.currencies.isEmpty && quotes.isEmpty)
                
                guard isNotEmpty else {
                    return
                }
                
                let exhcangeRates = self.refine(quotes, withSourceCurrency: sourceCurrency)
                
                var defaults = AppDefaults()
                
                let date = Date().dateByAdding(
                    minutes: Constants.StandardMinuteInterval
                )
                
                defaults.dateInterval = date.toString
                
                self.store(
                    currencies: currencyResponse.currencies,
                    exhangeRates: exhcangeRates
                )
                
                completed?(nil)
                
            }
        }
        
    }
    
}

// MARK: - ConversionServiceProtocol
extension ConversionService: ConversionCalculationServiceProtocol {

    func calculate(value: Double) -> NSDecimalNumber {
        defer {
            dataManager.inputtedRate = value
        }
        
        let targetCurrency = dataManager.targetCurrency.code
        guard let targetRate = databaseGateway.fetchConvertionRate(for: targetCurrency) else {
            return NSDecimalNumber(0.0)
        }
        
        return calculate(value, for: targetRate)
    }
    
    
    func recalculate(
        withNewCurrency currency: Currency,
        for scheme: CurrencyDataScheme
    ) -> NSDecimalNumber {
        
        dataManager.update(scheme, with: currency)
        
        return calculate(value: dataManager.inputtedRate)
    }
    
    func swapAndRecalculateRates() -> NSDecimalNumber {
        let source = dataManager.sourceCurrency
        let target = dataManager.targetCurrency
        
        dataManager.sourceCurrency = target
        dataManager.targetCurrency = source
        
        return calculate(value: dataManager.inputtedRate)
    }
    
}

// MARK: - ConversionPickerServiceProtocol
extension ConversionService: ConversionPickerServiceProtocol {

    func getAllRatesSummaryCalculation() -> [CalculationSummary] {
        
        let input = dataManager.inputtedRate != 0 ? dataManager.inputtedRate : 1
        let sourceCurrency = dataManager.sourceCurrency
        
        let allRates = databaseGateway.fetchAllConversionRates()
            .filter({ $0.currency != sourceCurrency.code })
            .sorted(by: { $0.currency < $1.currency })
        
        let allCurrencies = databaseGateway.fetchAllCurrencies()
        
        return allRates.map { targetRate in
            let calculatedRate = calculate(input, for: targetRate)
            let baseRate = getBaseRate(for: targetRate)
            
            print("base: \(baseRate.doubleValue)")
            print("result: \(calculatedRate.doubleValue)")
            
            guard let targetCurrency = allCurrencies.first(where: { $0.code == targetRate.currency }) else {
                return CalculationSummary()
            }
            
            return CalculationSummary(
                source: sourceCurrency,
                target: targetCurrency,
                info: (baseRate.valueWithComma, calculatedRate.valueWithComma)
            )
        }
    }
    
}

// MARK: - Private Methods Methods
extension ConversionService {
    
    func refine(_ rates: [ExchangeRate], withSourceCurrency source: String) -> [ExchangeRate] {
        return rates.map {
            var currency = $0.currency.remove(source.uppercased())
            currency = currency.isEmpty ? source.uppercased() :currency
            
            return ExchangeRateDTO(
                currency: currency,
                rate: $0.rate
            )
        }
    }
    
    func store(currencies: [Currency], exhangeRates: [ExchangeRate]) {
        databaseGateway.store(currencies: currencies)
        databaseGateway.storeAllConversionRates(exhangeRates)
    }
    
    func calculate(_ inputtedAmount: Double, for target: ExchangeRate) -> NSDecimalNumber {
        guard inputtedAmount != 0 else { return 0.0 }
        
        return getBaseRate(for: target).multiplying(by: NSDecimalNumber(value: inputtedAmount)).rounded()
    }
    
    func getBaseRate(for target: ExchangeRate) -> NSDecimalNumber {
        let sourceCurrency = dataManager.sourceCurrency.code
        let sourceRate = databaseGateway.fetchConvertionRate(for: sourceCurrency)?.rate ?? 0.0
        
        return NSDecimalNumber(value: target.rate/sourceRate)
    }
    
}
