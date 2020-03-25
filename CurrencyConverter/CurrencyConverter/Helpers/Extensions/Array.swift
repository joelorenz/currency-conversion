//
//  Array.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

extension Array {
    
    func chunked(by size: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, self.count)])
        }
    }
    
}
