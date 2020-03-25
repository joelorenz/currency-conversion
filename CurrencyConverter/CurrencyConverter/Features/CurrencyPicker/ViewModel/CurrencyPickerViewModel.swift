//
//  CurrencyPickerViewModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyPickerViewModel: CurrencyPickerViewModelProtocol {
    
    // MARK: - @Properties - Signals
    let reloadData = MutableProperty(())
    
    // MARK: - @Properties - Injections
    var conversionService: ConversionPickerServiceProtocol!
    var router: CurrencyPickerRouterInput!
    
    private(set) var selectedScheme: CurrencyDataScheme
    
    // MARK: - @Properties - Public
    private(set) var dataSource = [CurrencyPickerCellViewModel]()
    
    // MARK: - @Properties - Private
    private var summaryList = [CalculationSummary]()
    
    // MARK: - Initialization
    init(scheme: CurrencyDataScheme) {
        selectedScheme = scheme
    }
    
}

// MARK: - Public Methods
extension CurrencyPickerViewModel {
    
    func viewIsReady() {
        initiateDataSource()
    }
    
    func search(_ text: String) {
        guard !text.isEmpty else {
            return loadDataSource()
        }
        
        let string = text.lowercased()
        dataSource = summaryList
            .filter({ $0.targetCurrency(contains: string) })
            .map({ CurrencyPickerCellViewModel(summary: $0)})
        
        reloadData.value = ()
    }
    
    func getCurrency(at row: Int) -> Currency? {
        guard row < dataSource.count else { return nil }
        
        let code = dataSource[row].currencyCode
        
        return summaryList
            .map({ $0.target })
            .first(where: { $0.code == code })
    }
    
}

// MARK: - Private Methods
private extension CurrencyPickerViewModel {
    
    func initiateDataSource() {
        summaryList = conversionService.getAllRatesSummaryCalculation()
        
        loadDataSource()
    }
    
    func loadDataSource() {
        dataSource = summaryList.map({ CurrencyPickerCellViewModel(summary: $0)})
        
        reloadData.value = ()
    }
    
}
