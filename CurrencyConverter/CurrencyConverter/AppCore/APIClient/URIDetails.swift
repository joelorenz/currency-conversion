//
//  URIDetails.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

enum HTTPMethod: String, Codable {
    
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
    
}

protocol ApiMethodInfo  {
    
    var httpHeaders: [String: String]? { get }
    var urlQuery: String? { get }
    
    var protected: Bool { get }
    var method: HTTPMethod { get }
    var path: String { get }
    
}

struct URIDetails: ApiMethodInfo, Codable {
    
    private(set) var httpHeaders: [String : String]?
    private(set) var urlQuery: String?
    private(set) var method: HTTPMethod = .post
    private(set) var path: String = ""
    private(set) var protected: Bool = false
    
}

extension URIDetails {
    
    enum CodingKeys: String, CodingKey {
      case httpHeaders, urlQuery, protected, method, path
    }
    
}

