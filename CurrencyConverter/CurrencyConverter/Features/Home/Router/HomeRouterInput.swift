//
//  HomeRouterInput.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol HomeRouterInput {
    
    func showCurrencyPicker(
        scheme: CurrencyDataScheme,
        delegate: CurrencyPickerControllerDelegate
    )
    
}
