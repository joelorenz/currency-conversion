//
//  EndpointResponse.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import XCTest

@testable import CurrencyConverter

protocol EndpointResponse {
  
    func decodeResponseValue<T: Decodable>(jsonFileName: String) -> T?
  
}

extension EndpointResponse where Self: XCTestCase {
  
  func decodeResponseValue<T: Decodable>(jsonFileName: String) -> T? {
    return APIReponseGenerator.modelResponse(from: jsonFileName)
  }
  
}
