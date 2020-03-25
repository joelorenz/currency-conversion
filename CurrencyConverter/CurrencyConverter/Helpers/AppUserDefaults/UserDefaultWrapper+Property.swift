//
//  UserDefaultWrapper+Property.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

// MARK: - PropertyListValue Protocol
protocol PropertyListValue { }

extension Data: PropertyListValue { }

extension String: PropertyListValue { }

extension Date: PropertyListValue { }

extension Bool: PropertyListValue { }

extension Int: PropertyListValue { }

extension Double: PropertyListValue { }

extension Float: PropertyListValue { }

