//
//  Constants+HTTPStatusCode.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

enum HTTPStatusCode: Int, Codable {
  
    case accessKeyRequired = 101
    case accountIsNotActive = 102
    case apiDoesNotExist = 103
    case hasReachSubscriptionLimit = 104
    case notSupported = 105
    case noResults = 106
    
    case success = 200
    case invalidSourceCurrency = 201
    case invalidCurrencyCode = 202
    
    case specifyDate = 301
    case invalidDate = 302
    
    case invalidFromProperty = 401
    case invalidToProperty = 402
    case invalidAmountProperty = 403
    case notFound = 404
    
    case timeFrameRequired = 501
    case invalidStartDateProperty = 502
    case invalidEndDateProperty = 503
    case invalidTimeFrame = 504
    case invalidTimeFrameExceeds = 505
    
    case uriMethodNotFound = 1001
    
    case unknown = 1002
    
    case noInternet = -1009
  
}

// MARK: - Comparable
extension HTTPStatusCode: Comparable {
  
  static func < (lhs: HTTPStatusCode, rhs: HTTPStatusCode) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
  
  static func <= (lhs: HTTPStatusCode, rhs: HTTPStatusCode) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
  static func >= (lhs: HTTPStatusCode, rhs: HTTPStatusCode) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }
  
  static func > (lhs: HTTPStatusCode, rhs: HTTPStatusCode) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
}
