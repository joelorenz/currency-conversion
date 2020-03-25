//
//  APIResponseGenerator.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import XCTest

@testable import CurrencyConverter

struct APIReponseGenerator {
    
    static func modelResponse<T: Decodable>(from jsonFileName: String) -> T? {
        do {
            let dict = try FileHelper.jsonDictionaryFromFile(jsonFileName)
            let data = try JSONSerialization.data(withJSONObject: dict)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            XCTFail(error.localizedDescription, file: #file , line: #line)
            return nil
        }
      
    }
    
}
