//
//  AppConfigurable.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

enum BuildEnvironment: String {
    case development = "Developement"
}

enum BaseURLType {
    case `default`
    
    var description: String {
        switch self {
        case .`default`:
            return "baseURL"
        }
    }
}

protocol ApplicationConfigurable {
    var environment: BuildEnvironment { get }
    
    var apiAccessKey: String { get }
    
    var uri: [String: ApiMethodInfo?] { get }
    
    var isNetworkLoggingEnabled: Bool { get }
    
    var isDeviceLoggingEnabled: Bool { get }
    
    
    func baseURL(type: BaseURLType) -> String
}
