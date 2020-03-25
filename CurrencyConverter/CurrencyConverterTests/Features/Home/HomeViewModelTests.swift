//
//  HomeViewModelTests.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/25/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import XCTest
import ReactiveSwift

@testable import CurrencyConverter

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = HomeViewModel()
        
        let dataManager = ConversionDataManager(appConfig: AppConfig())
        
        let conversionService = ConversionService()
        conversionService.databaseGateway = DummyDatabaseGateway()
        conversionService.dataManager = dataManager
        
        let currencyService = CurrencyService()
        currencyService.dataManager = dataManager
        
        sut.conversionService = conversionService
        sut.currencyService = currencyService
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialValues() {
        
        XCTAssertEqual(sut.inputValue.value, "", "Input value should initially be empty")
        
        XCTAssertEqual(sut.convertedValue.value, "0.0", "Input value should initially be 0.0")
        
        sut.sourceCurrency.listener.observeValues { currency in
            XCTAssertEqual(currency, "USD", "Source currency should initially be USD")
        }
        
        sut.targetCurrency.listener.observeValues { currency in
            XCTAssertEqual(currency, "JPY", "Target currency should initially be JPY")
        }
        
        sut.viewIsReady()
        
    }
    
    func testCalculate() {
        let inputValue = "1"
        
        sut.inputValue.signal.observeValues { (input) in
            XCTAssertEqual(input, inputValue, "Input value should be the same")
        }
        
        sut.convertedValue.signal.observeValues { (rate) in
            XCTAssertEqual(rate, "111.47750", "Expected result should be `111.47750`")
        }
        
        sut.setInput(text: inputValue)
        
    }
    
    func testSwapCurrencies() {
        
        sut.sourceCurrency.listener.observeValues { currency in
            XCTAssertEqual(currency, "JPY", "Source currency should be JPY")
        }
        
        sut.targetCurrency.listener.observeValues { currency in
            XCTAssertEqual(currency, "USD", "Target currency should be USD")
        }
        
        sut.didSelectSwapButton()
        
    }
    
}
