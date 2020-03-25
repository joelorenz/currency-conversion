//
//  HomeViewModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift
import Swinject

class HomeViewModel: HomeViewModelProtocol {
    
    
    var inputValue = MutableProperty("")
    var convertedValue = MutableProperty("0.0")
    
    var sourceCurrency = SignalObserver<String>()
    var targetCurrency = SignalObserver<String>()
    
    // MARK: - @Properties - Injections
    var conversionService: ConversionCalculationServiceProtocol!
    var currencyService: CurrencyServiceProtocol!
    var router: HomeRouterInput!
    
}

// MARK: - Methods
extension HomeViewModel {
    
    func viewIsReady() {
        
        if !(AppDefaults().isFirsLaunch ?? false) {
            beginCalculation(input: "1")
        }
        
        observableUpdateCurrency()
    }
    
    func setInput(text: String) {
        var currentText = inputValue.value
        
        switch text {
        case "\\b":
            currentText = "\(currentText.dropLast())"
        case ".":
            guard !currentText.contains(text) else { return }
            currentText.append(text)
        default:
            currentText.append(text)
        }
        
        beginCalculation(input: currentText)
    }
    
    func didSelectCurrencyButton(with scheme: CurrencyDataScheme) {
        router.showCurrencyPicker(scheme: scheme, delegate: self)
    }
    
    func didSelectSwapButton() {
        
        convertedValue.value = conversionService.swapAndRecalculateRates().valueWithComma
        observableUpdateCurrency()
        
    }
    
}

// MARK: - CurrencyPickerControllerDelegate
extension HomeViewModel: CurrencyPickerControllerDelegate {
    
    func currencyPicker(
        _ picker: CurrencyPickerController,
        didTapCurrency currency: Currency,
        scheme: CurrencyDataScheme
    ) {
        
        if inputValue.value.isEmpty && !(AppDefaults().isFirsLaunch ?? false) {
            inputValue.value = "1"
        }
        
        convertedValue.value = conversionService.recalculate(
            withNewCurrency: currency,
            for: scheme
        ).valueWithComma
        
        observableUpdateCurrency()
    }
    
}

// MARK: - Private Methods
private extension HomeViewModel {
    
    func beginCalculation(input text: String) {
        inputValue.value = text
        
        guard let value = text.toDouble, value != 0.0 else {
            convertedValue.value = "0.0"
            return
        }
        
        convertedValue.value = conversionService.calculate(value: value).valueWithComma
    }
    
    func observableUpdateCurrency() {
        sourceCurrency.sender.send(value: currencyService.getCurrency(for: .source))
        targetCurrency.sender.send(value: currencyService.getCurrency(for: .target))
    }
    
}
