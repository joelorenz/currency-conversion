//
//  APIErrorModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct HTTPError: Error {
    
    let code: HTTPStatusCode
    let info: String
    
    init(_ error: Error) {
        guard (error as NSError).code == HTTPStatusCode.noInternet.rawValue else {
                
            code = .unknown
            info = Constants.GenericErrorMessage
                
            return
        }
        
        code = .noInternet
        info = error.localizedDescription
    }
    
    init(_ errorCode: HTTPStatusCode) {
        code = errorCode
        info = Constants.GenericErrorMessage
    }
    
}

extension HTTPError: Codable {

    enum CodingKeys: String, CodingKey {
        case code, info
    }
    
}
