//
//  CurrencyPickerViewModelProtocol.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol CurrencyPickerViewModelProtocol {
    
    var reloadData: MutableProperty<Void> { get }
    
    var dataSource: [CurrencyPickerCellViewModel] { get }
    
    var selectedScheme: CurrencyDataScheme { get }
    
    func viewIsReady()
    
    func search(_ text: String)
    
    func getCurrency(at row: Int) -> Currency?
    
}
