//
//  String.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

extension String {

    /// Checks whether the current string is number or not.
    var isNumber: Bool {
        return Double(self) != nil
    }
    
    var toDouble: Double? {
        return Double(self)
    }
    
    /// Returns a new string in which the occurance of the specified `text` is removed.
    /// - Parameter text: Is the string that will be removed.
    func remove(_ text: String) -> String {
        return self.replacingOccurrences(of: text, with: "")
    }
    
}
