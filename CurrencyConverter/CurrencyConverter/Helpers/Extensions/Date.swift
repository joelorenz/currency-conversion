//
//  Date.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

extension Date {
    
    var isExpired: Bool {
        return Date() > self
    }
    
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let string = dateFormatter.string(from: self)
        
        return string
    }
    
    static func date(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        return dateFormatter.date(from: string)
    }
    
    var timeDifferenceSinceNow: (hours: Int, minutes: Int, seconds: Int) {
        let startTime = Date().timeIntervalSinceNow
        let endTime = self.timeIntervalSinceNow

        let totalSeconds = endTime-startTime

        let hours = Int(totalSeconds / 3600)
        let minutes = Int((totalSeconds.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        
        return (hours, minutes, seconds)
    }
  
    func dblog() -> String {
        return Constants.Formatters.debugConsoleDateFormatter.string(from: self)
    }
    
    func dateByAdding(minutes: Int) -> Date {
        return self.addingTimeInterval(
            TimeInterval(minutes * 60)
        )
    }
  
}
