//
//  APIResponseTests.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import XCTest

@testable import CurrencyConverter

class APIResponseTests: XCTestCase, EndpointResponse {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessfulCurrencyResponse() {
        
        let currencies: APICurrencyResponse? = decodeResponseValue(jsonFileName: "APICurrencyResponseTests_200")
        
        XCTAssertNotNil(currencies, "Response should not be nil")
        
        XCTAssertTrue(currencies!.success, "Response should be successful")
        
        XCTAssertNotEqual(currencies!.currencies.count, 0, "List of currencies should not be empty.")
        
    }
    
    func testSuccessfulExchangeRateResponse() {
        
        let rates: APIExchangeRateResponse? = decodeResponseValue(jsonFileName: "APIExchangeRateResponseTests_200")
        
        XCTAssertNotNil(rates, "Response should not be nil")
        
        XCTAssertTrue(rates!.success, "Success status should be true")
        
        XCTAssertNotEqual(rates!.quotes!.count, 0, "List of exchange rates should not be empty.")
        
    }
    
    func testNotSupportedExchangeRateResponse() {
        
        let rates: APIExchangeRateResponse? = decodeResponseValue(jsonFileName: "APIExchangeRateResponseTests_105")
        
        XCTAssertNotNil(rates, "Response should not be nil")
        
        XCTAssertEqual(rates!.error!.code, HTTPStatusCode.notSupported, "List of exchange rates should not be empty.")
        
    }
    
}
