//
//  URLComponents.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

extension URLComponents {
    
    /// This method will set value to queryItems of the url.
    /// - Parameter parameters: Items that will be added as url query parameters
    mutating func setQueryItems(_ parameters: [String: Any]?) {
        self.queryItems = parameters?.map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
    }
    
}
