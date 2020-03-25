//
//  UserDefaultWrapper+Property.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

// MARK: - PropertyListValue Protocol
protocol PropertyValue { }

extension Data: PropertyValue { }

extension String: PropertyValue { }

extension Date: PropertyValue { }

extension Bool: PropertyValue { }

extension Int: PropertyValue { }

extension Double: PropertyValue { }

extension Float: PropertyValue { }

