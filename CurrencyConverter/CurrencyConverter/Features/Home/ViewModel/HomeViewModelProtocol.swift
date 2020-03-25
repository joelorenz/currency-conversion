//
//  HomeViewModelProtocol.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol HomeViewModelProtocol {
    
    var inputValue: MutableProperty<String> { get set }
    var convertedValue: MutableProperty<String> { get set }
    
    var sourceCurrency: SignalObserver<String> { get }
    var targetCurrency: SignalObserver<String> { get }
    
    func viewIsReady()
    func setInput(text: String)
    
    func didSelectCurrencyButton(with scheme: CurrencyDataScheme)
    
    func didSelectSwapButton()
    
}
