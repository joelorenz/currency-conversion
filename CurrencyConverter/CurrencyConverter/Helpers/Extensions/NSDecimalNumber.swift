//
//  NSDecimalNumber.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol CommaSeparatedValue {
    var valueWithComma: String { get }
    var valueWithNonFractionalComma: String { get }
}

extension Int: CommaSeparatedValue { }

extension Float: CommaSeparatedValue { }

extension Double: CommaSeparatedValue { }

extension CommaSeparatedValue {
    /// This will return a Fractional Comma Separated String Value
    
    var valueWithComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.minimumFractionDigits = 5
        numberFormatter.maximumFractionDigits = 5
        
        switch self {
        case is Int:
            return numberFormatter.string(from: NSNumber(value: self as! Int)) ?? ""
        case is Float:
            return numberFormatter.string(from: NSNumber(value: self as! Float)) ?? ""
        case is Double:
            return numberFormatter.string(from: NSNumber(value: self as! Double)) ?? ""
        default:
            return ""
        }
    }
    
    /// This will return a Non-Fractional Comma Separated String Value
    var valueWithNonFractionalComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        switch self {
        case is Int:
            return numberFormatter.string(from: NSNumber(value: self as! Int)) ?? ""
        case is Float:
            return numberFormatter.string(from: NSNumber(value: self as! Float)) ?? ""
        case is Double:
            return numberFormatter.string(from: NSNumber(value: self as! Double)) ?? ""
        default:
            return ""
        }
    }
}

extension NSDecimalNumber: CommaSeparatedValue {
    
    func rounded(places: Int = 6) -> NSDecimalNumber {
        var decimalValue = self.decimalValue
        var result: Decimal = 0
        NSDecimalRound(&result, &decimalValue, places, .plain)
        return NSDecimalNumber(decimal: result)
    }
    
}
