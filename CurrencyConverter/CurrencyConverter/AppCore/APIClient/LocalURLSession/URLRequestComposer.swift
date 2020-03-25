//
//  URLRequestComposer.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct URLRequestComposer {
    
    // MARK: - @Properties - Constants
    private let DefaultTimeOutInterval = TimeInterval(120)
    private let DefaultCachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
    
    // MARK: - @Properties - Public
    var cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy
    
    // MARK: - @Properties - Public-Getter
    private(set) var baseUrl = ""
    private(set) var uriDetails: ApiMethodInfo = URIDetails()
    private(set) var parameters: [String: Any]?
    private(set) var encoding: ParameterEncoding = .url
    
    // MARK: - @Properties - Private
    private var authHeader: String?
    
    /// This is a helper property that converts bodyParameters to Data and will be used for setting `httpBody`.
    private var postData: Data? {
        guard let parameters = parameters else { return nil }
        return try? JSONSerialization.data(withJSONObject: parameters, options: [])
    }
    
    // MARK: - Initializer
    init(
        baseUrl: String,
        uri uriDetails: ApiMethodInfo,
        parameters: [String: Any]? = nil,
        encoding: ParameterEncoding,
        authHeader: String? = nil
    ) {
        self.baseUrl = baseUrl
        self.uriDetails = uriDetails
        self.parameters = parameters
        self.encoding = encoding
        self.authHeader = authHeader
    }
    
    // MARK: - Public - Getter
    var compose: URLRequest {
        var request = composeRequest()
        
        request.httpMethod = uriDetails.method.rawValue
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        if let accessToken = authHeader, uriDetails.protected {
            request.setValue("Authorization", forHTTPHeaderField: accessToken)
        }
        
        request.timeoutInterval = DefaultTimeOutInterval
        request.cachePolicy = cachePolicy
        
        if let headers = uriDetails.httpHeaders {
            headers.forEach({ (key, value) in
                request.setValue(value, forHTTPHeaderField: key)
            })
        }
        
        
        return request
    }
    
}

// MARK: - Private Methods Methods
private extension URLRequestComposer {
    
    func composeRequest() -> URLRequest {
        var urlComponents = URLComponents(string: baseUrl)!
        urlComponents.path = uriDetails.path
        urlComponents.query = uriDetails.urlQuery
        
        guard encoding == .url else {
            var request = URLRequest(url: urlComponents.url!)
            request.httpBody = postData
            
            return request
        }
        
        urlComponents.setQueryItems(parameters)
        
        return URLRequest(url: urlComponents.url!)
    }
    
}
