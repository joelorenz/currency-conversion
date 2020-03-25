//
//  RefreshManager.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

class RefreshManager {
    
    // MARK: - @Properties - Private
    private let conversionService: ConversionServiceProtocol
    private let defaults = AppDefaults()
    
    private var dateInterval: Date? {
        return Date.date(from: defaults.dateInterval ?? "")
    }
    
    init(service: ConversionServiceProtocol) {
        conversionService = service
    }
    
    @objc func loadAllData() {

        if let date = dateInterval, !date.isExpired {
            startTimer()
        } else {
            beginFetchingData()
        }
        
    }
    
}

// MARK: - Private Method
private extension RefreshManager {
    
    func beginFetchingData() {
        conversionService.fetchCurrenciesAndRates { [weak self] (error) in
            guard let _error = error else {
                self?.startTimer()
                return
            }
            
            UIAlertController.showFromRoot(
                withTitle: "Sorry, something went wrong",
                message: _error.info
            )
        }
    }
    
    func startTimer() {
        var secondsInterval = Constants.StandardTimeInterval
        
        if let difference = dateInterval?.timeDifferenceSinceNow {
            let totalTime = (difference.minutes * 60) + difference.seconds
            
            secondsInterval = TimeInterval(totalTime)
        }
        
        Timer.scheduledTimer(
            timeInterval: secondsInterval,
            target: self,
            selector: #selector(loadAllData),
            userInfo: nil,
            repeats: false
        )
    }
    
}
