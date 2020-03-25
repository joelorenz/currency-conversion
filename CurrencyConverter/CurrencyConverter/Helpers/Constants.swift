//
//  Constants.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

typealias ConversionAmountInfo = (base: String, result: String)

/// Typealias for closures that take HTTPError argument and return Void type.
typealias CompletionWithErrorClosure = (HTTPError?) -> Void

/// Typealias for closures that take Void argument and return Void type.
typealias CompletionClosure = () -> Void

/// Typealias for closures that take an optional Error argument and return a Void type.
typealias FailureClosure = (Error?) -> Void

struct Constants {
    static let StandardMinuteInterval = 30
    static let StandardTimeInterval = TimeInterval(1800)
    
    static let DefaultSourceCurrency = "USD"
    
    static let GenericErrorMessage = "We could not load or update the latest data as of this time, please check back later for the updated results."
    
    struct Formatters {
        static let debugConsoleDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy HH:mm:ss.SSS"
            formatter.timeZone = TimeZone(identifier: "UTC")!
            return formatter
        }()
    }
  
}
