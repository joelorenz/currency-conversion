//
//  CurrencyPickerViewModelTests.swift
//  CurrencyConverterTests
//
//  Created by Joe Lorenz Florentino on 3/25/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import XCTest

@testable import CurrencyConverter

class CurrencyPickerViewModelTests: XCTestCase {
    
    var sut: CurrencyPickerViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let dataManager = ConversionDataManager(appConfig: AppConfig())
        
        let conversionService = ConversionService()
        conversionService.databaseGateway = DummyDatabaseGateway()
        conversionService.dataManager = dataManager
        
        sut = CurrencyPickerViewModel(scheme: .target)
        sut.conversionService =  conversionService
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialValues() {
        
        XCTAssertEqual(sut.selectedScheme, .target, "Scheme should be equal to the selected scheme.")
        
    }
    
    func testSearch() {
        
        sut.viewIsReady()
        
        sut.search("JPY")
        XCTAssertEqual(sut.dataSource.first?.currencyCode, "JPY", "The currency result should have been JPY")
        
        
        sut.search("EUR")
        XCTAssertNil(sut.dataSource.first, "The result should be nil since there's no EUR in the mocked currencies")
        
    }
    
    func testGetCurrency() {
        
        sut.viewIsReady()
        
        XCTAssertEqual(sut.getCurrency(at: 0)?.code, "JPY", "The currency result should have been USD")
        
        XCTAssertNil(sut.getCurrency(at: 5), "The result should be nil since the index is out of bounds")
        
    }

}
